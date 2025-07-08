import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MatSnackBarModule, MatSnackBar } from '@angular/material/snack-bar';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { Router } from '@angular/router';
import { AuthService } from '../../../services/auth.service';
import { FavoritesService, Favorite } from '../../../services/favorites/favorites.service';
import { UserService } from '../../../services/admin/user.service';
import { PaginationComponent } from '../../../components/shared/pagination/pagination';

@Component({
  selector: 'app-favorites',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatToolbarModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatSnackBarModule,
    MatProgressSpinnerModule,
    MatInputModule,
    MatFormFieldModule,
    TranslatePipe,
    PaginationComponent
  ],
  templateUrl: './favorites.html',
  styleUrl: './favorites.css'
})
export class FavoritesPage implements OnInit {
  // Favorites section
  favorites: Favorite[] = [];
  displayedColumns: string[] = ['name', 'email', 'actions'];
  loading = true;
  error = '';

  // Users section
  users: any[] = [];
  filteredUsers: any[] = [];
  userDisplayedColumns: string[] = ['name', 'email', 'role', 'actions'];
  usersLoading = true;
  usersError = '';
  searchTerm = '';

  // Pagination for users
  currentPage = 1;
  pageSize = 5;
  totalItems = 0;
  totalPages = 0;

  constructor(
    private router: Router,
    private authService: AuthService,
    private favoritesService: FavoritesService,
    private userService: UserService,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    // Get the current user from the auth service
    const user = this.authService.currentUserValue;

    // If user is not authenticated, redirect to auth page
    if (!user) {
      this.router.navigate(['/auth']);
      return;
    }

    // Load favorites
    this.loadFavorites(user.id);

    // Load users
    this.loadUsers();
  }

  /**
   * Load favorites for the current user
   */
  loadFavorites(userId: number): void {
    this.loading = true;
    this.favoritesService.getFavorites(userId)
      .then(favorites => {
        this.favorites = favorites;
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load favorites. Please try again.';
        this.loading = false;
        console.error('Error loading favorites:', error);
      });
  }

  /**
   * Remove a user from favorites
   */
  removeFavorite(favoriteId: number): void {
    this.favoritesService.removeFavorite(favoriteId)
      .then(success => {
        if (success) {
          this.favorites = this.favorites.filter(fav => fav.id !== favoriteId);
          this.snackBar.open('User removed from favorites', 'Close', {
            duration: 3000
          });
        } else {
          this.snackBar.open('Failed to remove user from favorites', 'Close', {
            duration: 3000
          });
        }
      })
      .catch(error => {
        this.snackBar.open('Failed to remove user from favorites', 'Close', {
          duration: 3000
        });
        console.error('Error removing favorite:', error);
      });
  }

  /**
   * Navigate to home page
   */
  goToHome(): void {
    this.router.navigate(['/']);
  }

  /**
   * Load all users
   */
  loadUsers(): void {
    this.usersLoading = true;
    this.userService.getUsers()
      .then(users => {
        this.users = users;
        this.applyFilter();
        this.usersLoading = false;
      })
      .catch(error => {
        this.usersError = 'Failed to load users. Please try again.';
        this.usersLoading = false;
        console.error('Error loading users:', error);
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

    this.totalItems = this.filteredUsers.length;
    this.totalPages = Math.ceil(this.totalItems / this.pageSize);
    this.updatePaginatedUsers();
  }

  /**
   * Update the paginated users based on current page and page size
   */
  updatePaginatedUsers(): void {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = Math.min(startIndex + this.pageSize, this.filteredUsers.length);
    // We don't need to store the paginated users separately as we'll calculate them in the template
  }

  /**
   * Get the current page of users
   */
  get paginatedUsers(): any[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = Math.min(startIndex + this.pageSize, this.filteredUsers.length);
    return this.filteredUsers.slice(startIndex, endIndex);
  }

  /**
   * Handle page change event
   */
  onPageChange(page: number): void {
    this.currentPage = page;
    this.updatePaginatedUsers();
  }

  /**
   * Add a user to favorites
   */
  addToFavorites(user: any): void {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      this.snackBar.open('You must be logged in to add favorites', 'Close', {
        duration: 3000
      });
      return;
    }

    this.favoritesService.addFavorite(currentUser.id, user.id, user.name, user.email)
      .then(favorite => {
        this.favorites.push(favorite);
        this.snackBar.open('User added to favorites', 'Close', {
          duration: 3000
        });
      })
      .catch(error => {
        this.snackBar.open('Failed to add user to favorites', 'Close', {
          duration: 3000
        });
        console.error('Error adding favorite:', error);
      });
  }

  /**
   * Check if a user is already in favorites
   */
  isInFavorites(userId: number): boolean {
    return this.favorites.some(fav => fav.favoriteUserId === userId);
  }
}
