import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { ApiService } from './api.service';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUserSubject: BehaviorSubject<User | null>;
  public currentUser$: Observable<User | null>;
  private tokenKey = 'auth_token';

  constructor(
    private apiService: ApiService,
    private router: Router
  ) {
    // Initialize from localStorage on service creation
    const storedUser = this.getStoredUser();
    this.currentUserSubject = new BehaviorSubject<User | null>(storedUser);
    this.currentUser$ = this.currentUserSubject.asObservable();
  }

  private getStoredUser(): User | null {
    const token = localStorage.getItem(this.tokenKey);
    if (!token) return null;

    try {
      // Decode the JWT token to get user info
      const payload = this.decodeToken(token);

      if (!payload) {
        console.error('Invalid token payload');
        return null;
      }

      // Extract roles from the payload
      const roles = payload.roles || [];
      const role = roles.length > 0 ? roles[0] : 'ROLE_USER';

      return {
        id: payload.id || 1,
        email: payload.sub || payload.email || 'user@example.com',
        name: payload.name,
        firstName: payload.firstName || payload.firstname,
        lastName: payload.lastName || payload.lastname,
        phone: payload.phone,
        role: role,
        token: token,
        tokenType: payload.tokenType || (role === 'ROLE_ADMIN' ? 'ADMIN' : 'USER')
      };
    } catch (error) {
      console.error('Error parsing stored user:', error);
      return null;
    }
  }

  private decodeToken(token: string): any {
    try {
      // JWT tokens are in the format: header.payload.signature
      // We only need the payload part
      const parts = token.split('.');
      if (parts.length !== 3) {
        console.error('Invalid token format');
        return null;
      }

      // Decode the base64-encoded payload
      const payload = parts[1];
      const base64 = payload.replace(/-/g, '+').replace(/_/g, '/');
      const jsonPayload = decodeURIComponent(
        atob(base64)
          .split('')
          .map(c => '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2))
          .join('')
      );

      return JSON.parse(jsonPayload);
    } catch (error) {
      console.error('Error decoding token:', error);
      return null;
    }
  }

  public get currentUserValue(): User | null {
    return this.currentUserSubject.value;
  }

  public isAuthenticated(): boolean {
    return !!this.currentUserValue;
  }

  public isAdmin(): boolean {
    const user = this.currentUserValue;
    return !!user && (user.role === 'ROLE_ADMIN' || user.tokenType === 'ADMIN');
  }

  public isUser(): boolean {
    const user = this.currentUserValue;
    return !!user && (user.role === 'ROLE_USER' || user.tokenType === 'USER');
  }

  login(email: string, password: string): Promise<User> {
    // Call the authentication API
    // Use the full URL to avoid any path resolution issues
    return this.apiService.post<any>('api/authentification/login', { email, password })
      .then(response => {
        // Handle the response format shown in the issue description
        const data = response.data;

        // Create a user object from the response data
        const user: User = {
          id: 1, // Default ID if not provided
          email: data.email,
          firstName: data.firstname,
          lastName: data.lastname,
          role: data.role,
          token: data.token,
          tokenType: data.tokenType
        };

        // Store token in localStorage
        if (user && user.token) {
          localStorage.setItem(this.tokenKey, user.token);
          this.currentUserSubject.next(user);
        }

        return user;
      });
  }

  register(firstName: string, lastName: string, email: string, password: string, confirm_password: string): Promise<User> {
    // Call the registration API
    // Use the full URL to avoid any path resolution issues
    return this.apiService.post<{ user: User }>('api/authentification/register', {
      firstName,
      lastName,
      email,
      password,
      confirm_password
    })
      .then(response => {
        const user = response.data.user;

        // Ensure user has a role property
        if (user && !user.role) {
          // New registrations are always 'user' role
          user.role = 'user';
        }

        // Store token in localStorage if it's returned with the registration
        if (user && user.token) {
          localStorage.setItem(this.tokenKey, user.token);
          this.currentUserSubject.next(user);
        }

        return user;
      });
  }

  logout(): void {
    // Remove token from localStorage
    localStorage.removeItem(this.tokenKey);
    this.currentUserSubject.next(null);

    // Navigate to login page
    this.router.navigate(['/auth']);
  }

  /**
   * Update user profile
   * @param userData The user data to update
   * @returns Promise with the updated user
   */
  updateUser(userData: Partial<User>): Promise<User> {
    // Get the current user
    const currentUser = this.currentUserValue;
    if (!currentUser) {
      return Promise.reject('No authenticated user');
    }

    // Call the API to update the user
    // Use the full URL to avoid any path resolution issues
    return this.apiService.put<{ user: User }>(`api/users/${currentUser.id}`, userData)
      .then(response => {
        const updatedUser = response.data.user;

        // Merge the updated user with the current user
        const mergedUser = {
          ...currentUser,
          ...updatedUser
        };

        // Update the stored user
        this.currentUserSubject.next(mergedUser);

        return mergedUser;
      });
  }

}
