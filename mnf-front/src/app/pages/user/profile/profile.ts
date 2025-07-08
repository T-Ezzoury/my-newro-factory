import { Component, OnInit } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { AuthService } from '../../../services/auth.service';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-profile',
  imports: [
    MatToolbarModule,
    TranslatePipe,
    CommonModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatFormFieldModule,
    MatInputModule,
    FormsModule,
    ReactiveFormsModule
  ],
  templateUrl: './profile.html',
  standalone: true,
  styleUrl: './profile.css'
})
export class ProfilePage implements OnInit {
  user: any = null;
  isEditing = false;

  constructor(
    private router: Router,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    // Get the current user from the auth service
    this.user = this.authService.currentUserValue;

    // If user is not authenticated, redirect to auth page
    if (!this.user) {
      this.router.navigate(['/auth']);
    }
  }

  /**
   * Toggle edit mode
   */
  toggleEditMode(): void {
    this.isEditing = !this.isEditing;
  }

  /**
   * Save profile changes
   */
  saveProfile(): void {
    // Call the AuthService to update the user profile
    this.authService.updateUser({
      name: this.user.name,
      firstName: this.user.firstName,
      lastName: this.user.lastName,
      email: this.user.email,
      phone: this.user.phone
    })
      .then(updatedUser => {
        console.log('Profile updated successfully', updatedUser);
        this.user = updatedUser;
        this.isEditing = false;
      })
      .catch(error => {
        console.error('Error updating profile', error);
        // You might want to show an error message to the user here
      });
  }

  /**
   * Navigate to home page
   */
  goToHome(): void {
    this.router.navigate(['/']);
  }

  /**
   * Logout the user
   */
  logout(): void {
    this.authService.logout();
    this.router.navigate(['/auth']);
  }
}
