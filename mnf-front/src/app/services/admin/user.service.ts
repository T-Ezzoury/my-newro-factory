import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';

interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private apiService: ApiService) {}

  getUsers(): Promise<User[]> {
    return this.apiService.get<User[]>('/api/users')
      .then(response => response.data)
      .catch(error => {
        console.error('Error fetching users:', error);
        return [];
      });
  }

  getUser(id: number): Promise<User | null> {
    return this.apiService.get<User>(`/api/users/${id}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching user with id ${id}:`, error);
        return null;
      });
  }

  createUser(user: Omit<User, 'id'>): Promise<User> {
    return this.apiService.post<User>('/api/users', user)
      .then(response => response.data)
      .catch(error => {
        console.error('Error creating user:', error);
        throw error;
      });
  }

  updateUser(id: number, user: Partial<User>): Promise<User | null> {
    return this.apiService.put<User>(`/api/users/${id}`, user)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error updating user with id ${id}:`, error);
        return null;
      });
  }

  deleteUser(id: number): Promise<boolean> {
    return this.apiService.delete(`/api/users/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting user with id ${id}:`, error);
        return false;
      });
  }
}
