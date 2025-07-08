import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { Promotion } from '../../models/admin/Promotion';

@Injectable({
  providedIn: 'root'
})
export class PromotionService {
  private readonly apiUrl = '/api/promotions';

  constructor(private apiService: ApiService) {}

  /**
   * Maps API response format to Promotion model format
   * @param apiPromotion The promotion data from API
   * @returns Promotion object with mapped fields
   */
  private mapApiPromotionToModel(apiPromotion: any): Promotion {
    return {
      id: apiPromotion.id,
      name: apiPromotion.nom || apiPromotion.name // Handle both "nom" and "name" fields
    };
  }

  /**
   * Maps Promotion model format to API request format
   * @param modelPromotion The promotion data from model
   * @returns Object with mapped fields for API
   */
  private mapModelPromotionToApi(modelPromotion: Partial<Promotion>): any {
    const apiPromotion: any = {
      nom: modelPromotion.name
    };

    // Include id if it exists (for updates)
    if (modelPromotion.id !== undefined) {
      apiPromotion.id = modelPromotion.id;
    }

    return apiPromotion;
  }

  /**
   * Get all promotions
   * @returns Promise with the promotions
   */
  public getPromotions(): Promise<Promotion[]> {
    return this.apiService.get<any>(this.apiUrl)
      .then(response => {
        if (response && response.data) {
          // Handle direct array in data
          if (Array.isArray(response.data)) {
            return response.data.map((promotion: any) => this.mapApiPromotionToModel(promotion));
          }
          // Handle promotions array in data.promotions
          else if (response.data.promotions && Array.isArray(response.data.promotions)) {
            return response.data.promotions.map((promotion: any) => this.mapApiPromotionToModel(promotion));
          }
          // Handle promotions array in data.promotionDtos
          else if (response.data.promotionDtos && Array.isArray(response.data.promotionDtos)) {
            return response.data.promotionDtos.map((promotion: any) => this.mapApiPromotionToModel(promotion));
          }
        }
        console.error('Error: API response is not in expected format', response);
        return [];
      })
      .catch(error => {
        console.error('Error fetching promotions:', error);
        return [];
      });
  }

  /**
   * Get a promotion by ID
   * @param id The promotion ID
   * @returns Promise with the promotion
   */
  public getPromotionById(id: number): Promise<Promotion | null> {
    return this.apiService.get<any>(`${this.apiUrl}/${id}`)
      .then(response => {
        if (response && response.data) {
          // Handle direct object in data
          if (!Array.isArray(response.data) && typeof response.data === 'object') {
            // Check if it's a promotion object directly
            if (response.data.id !== undefined) {
              return this.mapApiPromotionToModel(response.data);
            }
            // Check if it's in promotionDto
            else if (response.data.promotionDto) {
              return this.mapApiPromotionToModel(response.data.promotionDto);
            }
            // Check if it's in promotionDtos array
            else if (response.data.promotionDtos && Array.isArray(response.data.promotionDtos) && response.data.promotionDtos.length > 0) {
              return this.mapApiPromotionToModel(response.data.promotionDtos[0]);
            }
          }
          // Handle array in data (take the first item)
          else if (Array.isArray(response.data) && response.data.length > 0) {
            return this.mapApiPromotionToModel(response.data[0]);
          }
        }
        console.error(`Error fetching promotion ${id}: Invalid response format`, response);
        return null;
      })
      .catch(error => {
        console.error(`Error fetching promotion ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new promotion
   * @param promotion The promotion data
   * @returns Promise with the created promotion
   */
  public createPromotion(promotion: Omit<Promotion, 'id'>): Promise<Promotion | null> {
    // Convert from model format to API format
    const apiPromotion = this.mapModelPromotionToApi(promotion);

    return this.apiService.post<any>(this.apiUrl, apiPromotion)
      .then(response => {
        if (response && response.data) {
          // Handle direct object in data
          if (!Array.isArray(response.data) && typeof response.data === 'object') {
            // Check if it's a promotion object directly
            if (response.data.id !== undefined) {
              return this.mapApiPromotionToModel(response.data);
            }
            // Check if it's in promotionDto
            else if (response.data.promotionDto) {
              return this.mapApiPromotionToModel(response.data.promotionDto);
            }
            // Check if it's in promotionDtos array
            else if (response.data.promotionDtos && Array.isArray(response.data.promotionDtos) && response.data.promotionDtos.length > 0) {
              return this.mapApiPromotionToModel(response.data.promotionDtos[0]);
            }
          }
          // Handle array in data (take the first item)
          else if (Array.isArray(response.data) && response.data.length > 0) {
            return this.mapApiPromotionToModel(response.data[0]);
          }
        }
        console.error('Error creating promotion: Invalid response format', response);
        return null;
      })
      .catch(error => {
        console.error('Error creating promotion:', error);
        return null;
      });
  }

  /**
   * Update a promotion
   * @param id The promotion ID
   * @param promotion The promotion data
   * @returns Promise with the updated promotion
   */
  public updatePromotion(id: number, promotion: Partial<Promotion>): Promise<Promotion | null> {
    // Convert from model format to API format
    const apiPromotion = this.mapModelPromotionToApi(promotion);

    return this.apiService.put<any>(`${this.apiUrl}/${id}`, apiPromotion)
      .then(response => {
        if (response && response.data) {
          // Handle direct object in data
          if (!Array.isArray(response.data) && typeof response.data === 'object') {
            // Check if it's a promotion object directly
            if (response.data.id !== undefined) {
              return this.mapApiPromotionToModel(response.data);
            }
            // Check if it's in promotionDto
            else if (response.data.promotionDto) {
              return this.mapApiPromotionToModel(response.data.promotionDto);
            }
            // Check if it's in promotionDtos array
            else if (response.data.promotionDtos && Array.isArray(response.data.promotionDtos) && response.data.promotionDtos.length > 0) {
              return this.mapApiPromotionToModel(response.data.promotionDtos[0]);
            }
          }
          // Handle array in data (take the first item)
          else if (Array.isArray(response.data) && response.data.length > 0) {
            return this.mapApiPromotionToModel(response.data[0]);
          }
        }
        console.error(`Error updating promotion ${id}: Invalid response format`, response);
        return null;
      })
      .catch(error => {
        console.error(`Error updating promotion ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete a promotion
   * @param id The promotion ID
   * @returns Promise with success status
   */
  public deletePromotion(id: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting promotion ${id}:`, error);
        return false;
      });
  }
}
