import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FavoritesService, Favorite } from '../../../../services/favorites/favorites.service';
import { AuthService } from '../../../../services/auth.service';

@Component({
  selector: 'app-favorites-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './favorites-list.html',
  styleUrl: './favorites-list.css'
})
export class FavoritesListComponent {
  @Input() currentPage: number = 1;
  @Input() pageSize: number = 10;
  @Output() paginationChange = new EventEmitter<{ totalItems: number, totalPages: number }>();

  favorites: Favorite[] = [];
  loading: boolean = true;
  error: string = '';

  constructor(
    private favoritesService: FavoritesService,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.loadFavorites();
  }

  ngOnChanges(): void {
    this.loadFavorites();
  }

  private loadFavorites(): void {
    this.loading = true;

    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      this.error = 'You must be logged in to view favorites.';
      this.loading = false;
      return;
    }

    this.favoritesService.getFavorites(currentUser.id)
      .then(favorites => {
        this.favorites = favorites;
        this.updatePagination();
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load favorites. Please try again.';
        this.loading = false;
        console.error('Error loading favorites:', error);
      });
  }

  private updatePagination(): void {
    const totalItems = this.favorites.length;
    const totalPages = Math.ceil(totalItems / this.pageSize);
    this.paginationChange.emit({ totalItems, totalPages });
  }
}
