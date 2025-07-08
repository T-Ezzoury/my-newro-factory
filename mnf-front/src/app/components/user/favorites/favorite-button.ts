import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSnackBarModule, MatSnackBar } from '@angular/material/snack-bar';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { AuthService } from '../../../services/auth.service';
import { FavoritesService } from '../../../services/favorites/favorites.service';

@Component({
  selector: 'app-favorite-button',
  standalone: true,
  imports: [
    CommonModule,
    MatButtonModule,
    MatIconModule,
    MatTooltipModule,
    MatSnackBarModule,
    TranslatePipe
  ],
  templateUrl: './favorite-button.html',
  styleUrl: './favorite-button.css'
})
export class FavoriteButtonComponent implements OnInit {
  @Input() userId: number = 0;
  @Input() userName: string = '';
  @Input() userEmail: string = '';

  isFavorite: boolean = false;
  loading: boolean = false;
  currentUserId: number | null = null;

  constructor(
    private authService: AuthService,
    private favoritesService: FavoritesService,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    // Get the current user from the auth service
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      return;
    }

    this.currentUserId = currentUser.id;

    // Check if the user is already in favorites
    this.checkFavoriteStatus();
  }

  /**
   * Check if the user is already in favorites
   */
  checkFavoriteStatus(): void {
    if (!this.currentUserId || !this.userId) {
      return;
    }

    this.loading = true;
    this.favoritesService.isFavorite(this.currentUserId, this.userId)
      .then(isFavorite => {
        this.isFavorite = isFavorite;
        this.loading = false;
      })
      .catch(error => {
        console.error('Error checking favorite status:', error);
        this.loading = false;
      });
  }

  /**
   * Toggle favorite status
   */
  toggleFavorite(): void {
    if (!this.currentUserId || !this.userId) {
      this.snackBar.open('You must be logged in to add favorites', 'Close', {
        duration: 3000
      });
      return;
    }

    this.loading = true;

    if (this.isFavorite) {
      // Remove from favorites
      this.favoritesService.getFavorites(this.currentUserId)
        .then(favorites => {
          const favorite = favorites.find(f => f.favoriteUserId === this.userId);
          if (favorite) {
            return this.favoritesService.removeFavorite(favorite.id);
          }
          return Promise.resolve(false);
        })
        .then(success => {
          if (success) {
            this.isFavorite = false;
            this.snackBar.open('User removed from favorites', 'Close', {
              duration: 3000
            });
          } else {
            this.snackBar.open('Failed to remove user from favorites', 'Close', {
              duration: 3000
            });
          }
          this.loading = false;
        })
        .catch(error => {
          console.error('Error removing favorite:', error);
          this.snackBar.open('Failed to remove user from favorites', 'Close', {
            duration: 3000
          });
          this.loading = false;
        });
    } else {
      // Add to favorites
      this.favoritesService.addFavorite(this.currentUserId, this.userId, this.userName, this.userEmail)
        .then(favorite => {
          this.isFavorite = true;
          this.snackBar.open('User added to favorites', 'Close', {
            duration: 3000
          });
          this.loading = false;
        })
        .catch(error => {
          console.error('Error adding favorite:', error);
          this.snackBar.open('Failed to add user to favorites', 'Close', {
            duration: 3000
          });
          this.loading = false;
        });
    }
  }
}
