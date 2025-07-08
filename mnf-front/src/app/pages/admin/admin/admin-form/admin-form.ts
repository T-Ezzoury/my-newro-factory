import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AdminService } from '../../../../services/admin/admin.service';
import { MaterialModules } from '../../../../material/material';

@Component({
  selector: 'app-admin-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, MaterialModules],
  templateUrl: './admin-form.html',
  styleUrl: './admin-form.css'
})
export class AdminFormComponent implements OnInit {
  adminForm: FormGroup;
  isEditMode: boolean = false;
  adminId: number | null = null;
  loading: boolean = false;
  error: string = '';

  constructor(
    private fb: FormBuilder,
    private adminService: AdminService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.adminForm = this.fb.group({
      name: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]]
    });
  }

  ngOnInit(): void {
    // Check if we're in edit mode by looking for an ID in the route
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.adminId = parseInt(id, 10);
      this.loadAdmin(this.adminId);
    }
  }

  loadAdmin(id: number): void {
    this.loading = true;
    this.adminService.getAdmin(id)
      .then(admin => {
        if (admin) {
          this.adminForm.patchValue({
            name: admin.name,
            email: admin.email
          });
        } else {
          this.error = 'Admin not found';
        }
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load admin. Please try again.';
        this.loading = false;
        console.error('Error loading admin:', error);
      });
  }

  onSubmit(): void {
    if (this.adminForm.invalid) {
      return;
    }

    this.loading = true;
    const adminData = this.adminForm.value;

    if (this.isEditMode && this.adminId) {
      // Update existing admin
      this.adminService.updateAdmin(this.adminId, adminData)
        .then(admin => {
          if (admin) {
            this.router.navigate(['/admin/dashboard/admins']);
          } else {
            this.error = 'Failed to update admin. Please try again.';
          }
          this.loading = false;
        })
        .catch(error => {
          this.error = 'Failed to update admin. Please try again.';
          this.loading = false;
          console.error('Error updating admin:', error);
        });
    } else {
      // Create new admin
      this.adminService.createAdmin(adminData)
        .then(admin => {
          this.router.navigate(['/admin/dashboard/admins']);
          this.loading = false;
        })
        .catch(error => {
          this.error = 'Failed to create admin. Please try again.';
          this.loading = false;
          console.error('Error creating admin:', error);
        });
    }
  }

  cancel(): void {
    this.router.navigate(['/admin/dashboard/admins']);
  }
}
