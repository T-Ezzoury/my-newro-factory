import { Injectable } from '@angular/core';
import { ApiService } from './api.service';

interface User {
  id: number;
  name: string;
  email: string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {
  constructor(private apiService: ApiService) {}

  /**
   * Get all users
   * @returns Promise with the users
   */
  public getUsers(): Promise<User[]> {
    return this.apiService.get<User[]>('/users')
      .then(response => response.data)
      .catch(error => {
        console.error('Error fetching users:', error);
        return [];
      });
  }

  /**
   * Get a user by ID
   * @param id The user ID
   * @returns Promise with the user
   */
  public getUserById(id: number): Promise<User | null> {
    return this.apiService.get<User>(`/users/${id}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching user ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new user
   * @param user The user data
   * @returns Promise with the created user
   */
  public createUser(user: Omit<User, 'id'>): Promise<User | null> {
    return this.apiService.post<User>('/users', user)
      .then(response => response.data)
      .catch(error => {
        console.error('Error creating user:', error);
        return null;
      });
  }

  /**
   * Update a user
   * @param id The user ID
   * @param user The user data
   * @returns Promise with the updated user
   */
  public updateUser(id: number, user: Partial<User>): Promise<User | null> {
    return this.apiService.put<User>(`/users/${id}`, user)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error updating user ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete a user
   * @param id The user ID
   * @returns Promise with success status
   */
  public deleteUser(id: number): Promise<boolean> {
    return this.apiService.delete(`/users/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting user ${id}:`, error);
        return false;
      });
  }

  /**
   * Change the API environment
   * @param env The environment to set
   */
  public setEnvironment(env: 'default' | 'local' | 'dev' | 'preprod' | 'production'): void {
    this.apiService.setEnvironment(env);
  }
}
