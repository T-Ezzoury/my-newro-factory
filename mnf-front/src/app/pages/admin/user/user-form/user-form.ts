import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { UserService } from '../../../../services/admin/user.service';
import { MaterialModules } from '../../../../material/material';

@Component({
  selector: 'app-user-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, MaterialModules],
  templateUrl: './user-form.html',
  styleUrl: './user-form.css'
})
export class UserFormComponent implements OnInit {
  userForm: FormGroup;
  isEditMode: boolean = false;
  userId: number | null = null;
  loading: boolean = false;
  error: string = '';

  // Available roles for the dropdown
  roles: string[] = ['User', 'Editor', 'Viewer', 'Admin'];

  constructor(
    private fb: FormBuilder,
    private userService: UserService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.userForm = this.fb.group({
      name: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      role: ['User', [Validators.required]]
    });
  }

  ngOnInit(): void {
    // Check if we're in edit mode by looking for an ID in the route
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.userId = parseInt(id, 10);
      this.loadUser(this.userId);
    }
  }

  loadUser(id: number): void {
    this.loading = true;
    this.userService.getUser(id)
      .then(user => {
        if (user) {
          this.userForm.patchValue({
            name: user.name,
            email: user.email,
            role: user.role
          });
        } else {
          this.error = 'User not found';
        }
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load user. Please try again.';
        this.loading = false;
        console.error('Error loading user:', error);
      });
  }

  onSubmit(): void {
    if (this.userForm.invalid) {
      return;
    }

    this.loading = true;
    const userData = this.userForm.value;

    if (this.isEditMode && this.userId) {
      // Update existing user
      this.userService.updateUser(this.userId, userData)
        .then(user => {
          if (user) {
            this.router.navigate(['/admin/dashboard/users']);
          } else {
            this.error = 'Failed to update user. Please try again.';
          }
          this.loading = false;
        })
        .catch(error => {
          this.error = 'Failed to update user. Please try again.';
          this.loading = false;
          console.error('Error updating user:', error);
        });
    } else {
      // Create new user
      this.userService.createUser(userData)
        .then(user => {
          this.router.navigate(['/admin/dashboard/users']);
          this.loading = false;
        })
        .catch(error => {
          this.error = 'Failed to create user. Please try again.';
          this.loading = false;
          console.error('Error creating user:', error);
        });
    }
  }

  cancel(): void {
    this.router.navigate(['/admin/dashboard/users']);
  }
}
