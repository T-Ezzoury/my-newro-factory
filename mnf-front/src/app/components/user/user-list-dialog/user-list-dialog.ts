import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDividerModule } from '@angular/material/divider';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { AuthService } from '../../../services/auth.service';
import { UserService } from '../../../services/admin/user.service';
import { FavoritesService, Favorite } from '../../../services/favorites/favorites.service';

@Component({
  selector: 'app-user-list-dialog',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatDialogModule,
    MatButtonModule,
    MatIconModule,
    MatInputModule,
    MatFormFieldModule,
    MatDividerModule,
    MatProgressSpinnerModule,
    TranslatePipe
  ],
  templateUrl: './user-list-dialog.html',
  styleUrl: './user-list-dialog.css'
})
export class UserListDialogComponent implements OnInit {
  // All users
  users: any[] = [];
  filteredUsers: any[] = [];
  searchTerm: string = '';

  // Favorites
  favorites: Favorite[] = [];

  // Loading states
  loadingUsers: boolean = true;
  loadingFavorites: boolean = true;

  // Error states
  userError: string = '';
  favoriteError: string = '';

  constructor(
    private dialogRef: MatDialogRef<UserListDialogComponent>,
    private authService: AuthService,
    private userService: UserService,
    private favoritesService: FavoritesService
  ) {}

  ngOnInit(): void {
    this.loadUsers();
    this.loadFavorites();
  }

  /**
   * Load all users
   */
  loadUsers(): void {
    this.loadingUsers = true;
    this.userService.getUsers()
      .then(users => {
        this.users = users;
        this.applyFilter();
        this.loadingUsers = false;
      })
      .catch(error => {
        this.userError = 'Failed to load users';
        this.loadingUsers = false;
        console.error('Error loading users:', error);
      });
  }

  /**
   * Load favorites for the current user
   */
  loadFavorites(): void {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      this.loadingFavorites = false;
      return;
    }

    this.loadingFavorites = true;
    this.favoritesService.getFavorites(currentUser.id)
      .then(favorites => {
        this.favorites = favorites;
        this.loadingFavorites = false;
      })
      .catch(error => {
        this.favoriteError = 'Failed to load favorites';
        this.loadingFavorites = false;
        console.error('Error loading favorites:', error);
      });
  }

  /**
   * Apply search filter to users
   */
  applyFilter(): void {
    if (!this.searchTerm.trim()) {
      this.filteredUsers = [...this.users];
    } else {
      const searchTermLower = this.searchTerm.toLowerCase().trim();
      this.filteredUsers = this.users.filter(user =>
        user.name.toLowerCase().includes(searchTermLower)
      );
    }
  }

  /**
   * Check if a user is in favorites
   */
  isInFavorites(userId: number): boolean {
    return this.favorites.some(fav => fav.favoriteUserId === userId);
  }

  /**
   * Get favorite users
   */
  get favoriteUsers(): any[] {
    return this.filteredUsers.filter(user => this.isInFavorites(user.id));
  }

  /**
   * Get non-favorite users
   */
  get otherUsers(): any[] {
    return this.filteredUsers.filter(user => !this.isInFavorites(user.id));
  }

  /**
   * Toggle favorite status for a user
   */
  toggleFavorite(user: any): void {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      return;
    }

    if (this.isInFavorites(user.id)) {
      // Remove from favorites
      const favorite = this.favorites.find(f => f.favoriteUserId === user.id);
      if (favorite) {
        this.favoritesService.removeFavorite(favorite.id)
          .then(success => {
            if (success) {
              this.favorites = this.favorites.filter(f => f.id !== favorite.id);
            }
          })
          .catch(error => {
            console.error('Error removing favorite:', error);
          });
      }
    } else {
      // Add to favorites
      this.favoritesService.addFavorite(currentUser.id, user.id, user.name, user.email)
        .then(favorite => {
          this.favorites.push(favorite);
        })
        .catch(error => {
          console.error('Error adding favorite:', error);
        });
    }
  }

  /**
   * Close the dialog
   */
  close(): void {
    this.dialogRef.close();
  }
}
