import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';

interface Admin {
  id: number;
  name: string;
  email: string;
}

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  constructor(private apiService: ApiService) {}

  getAdmins(): Promise<Admin[]> {
    return this.apiService.get<Admin[]>('/api/admins')
      .then(response => response.data)
      .catch(error => {
        console.error('Error fetching admins:', error);
        return [];
      });
  }

  getAdmin(id: number): Promise<Admin | null> {
    return this.apiService.get<Admin>(`/api/admin/admins/${id}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching admin with id ${id}:`, error);
        return null;
      });
  }

  createAdmin(admin: Omit<Admin, 'id'>): Promise<Admin> {
    return this.apiService.post<Admin>('/api/admin/admins', admin)
      .then(response => response.data)
      .catch(error => {
        console.error('Error creating admin:', error);
        throw error;
      });
  }

  updateAdmin(id: number, admin: Partial<Admin>): Promise<Admin | null> {
    return this.apiService.put<Admin>(`/api/admin/admins/${id}`, admin)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error updating admin with id ${id}:`, error);
        return null;
      });
  }

  deleteAdmin(id: number): Promise<boolean> {
    return this.apiService.delete(`/api/admin/admins/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting admin with id ${id}:`, error);
        return false;
      });
  }
}
