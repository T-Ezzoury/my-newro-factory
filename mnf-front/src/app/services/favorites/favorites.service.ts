import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { BehaviorSubject, Observable } from 'rxjs';

export interface Favorite {
  id: number;
  userId: number;
  favoriteUserId: number;
  favoriteUserName?: string;
  favoriteUserEmail?: string;
  createdAt?: string;
}

@Injectable({
  providedIn: 'root'
})
export class FavoritesService {
  private favoritesSubject: BehaviorSubject<Favorite[]>;
  public favorites$: Observable<Favorite[]>;


  constructor(private apiService: ApiService) {
    this.favoritesSubject = new BehaviorSubject<Favorite[]>([]);
    this.favorites$ = this.favoritesSubject.asObservable();
  }

  /**
   * Get all favorites for the current user
   * @returns Promise with the favorites
   */
  getFavorites(userId: number): Promise<Favorite[]> {
    return this.apiService.get<Favorite[]>(`/api/favorites?userId=${userId}`)
      .then(response => {
        const favorites = response.data;
        this.favoritesSubject.next(favorites);
        return favorites;
      });
  }

  /**
   * Add a user to favorites
   * @param userId The current user's ID
   * @param favoriteUserId The ID of the user to add to favorites
   * @param favoriteUserName The name of the user to add to favorites
   * @param favoriteUserEmail The email of the user to add to favorites
   * @returns Promise with the created favorite
   */
  addFavorite(userId: number, favoriteUserId: number, favoriteUserName?: string, favoriteUserEmail?: string): Promise<Favorite> {
    return this.apiService.post<Favorite>('/api/favorites', {
      userId,
      favoriteUserId,
      favoriteUserName,
      favoriteUserEmail
    })
      .then(response => {
        const newFavorite = response.data;

        // Update the favorites subject with the new favorite
        const currentFavorites = this.favoritesSubject.value;
        this.favoritesSubject.next([...currentFavorites, newFavorite]);

        return newFavorite;
      });
  }

  /**
   * Remove a user from favorites
   * @param favoriteId The ID of the favorite to remove
   * @returns Promise with a boolean indicating success
   */
  removeFavorite(favoriteId: number): Promise<boolean> {
    return this.apiService.delete(`/api/favorites/${favoriteId}`)
      .then(() => {
        // Update the favorites subject by removing the favorite
        const currentFavorites = this.favoritesSubject.value;
        const updatedFavorites = currentFavorites.filter(fav => fav.id !== favoriteId);
        this.favoritesSubject.next(updatedFavorites);

        return true;
      })
      .catch(error => {
        console.error('Error removing favorite:', error);
        return false;
      });
  }

  /**
   * Check if a user is in favorites
   * @param userId The current user's ID
   * @param favoriteUserId The ID of the user to check
   * @returns Promise with a boolean indicating if the user is in favorites
   */
  isFavorite(userId: number, favoriteUserId: number): Promise<boolean> {
    return this.apiService.get<{ isFavorite: boolean }>(`/api/favorites/check?userId=${userId}&favoriteUserId=${favoriteUserId}`)
      .then(response => response.data.isFavorite)
      .catch(error => {
        console.error('Error checking favorite status:', error);
        return false;
      });
  }
}
