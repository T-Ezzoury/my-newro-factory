import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { Intern } from '../../models/admin/Intern';

@Injectable({
  providedIn: 'root'
})
export class InternService {
  private readonly apiUrl = '/api/stagiaires';

  constructor(private apiService: ApiService) {}

  /**
   * Get all interns
   * @returns Promise with the interns
   */
  /**
   * Maps API response format to Intern model format
   * @param apiIntern The intern data from API
   * @returns Intern object with mapped fields
   */
  private mapApiInternToModel(apiIntern: any): Intern {
    return {
      id: apiIntern.id,
      first_name: apiIntern.prenom,
      last_name: apiIntern.nom,
      arrival: apiIntern.date_arrivee,
      formation_over: apiIntern.date_depart,
      promotion_id: apiIntern.promotion?.id || null,
      promotion: apiIntern.promotion ? {
        id: apiIntern.promotion.id,
        name: apiIntern.promotion.nom
      } : undefined
    };
  }

  /**
   * Maps Intern model format to API request format
   * @param modelIntern The intern data from model
   * @returns Object with mapped fields for API
   */
  private mapModelInternToApi(modelIntern: Partial<Intern>): any {
    const apiIntern: any = {
      prenom: modelIntern.first_name,
      nom: modelIntern.last_name,
      date_arrivee: modelIntern.arrival,
      date_depart: modelIntern.formation_over
    };

    // Include id if it exists (for updates)
    if (modelIntern.id !== undefined) {
      apiIntern.id = modelIntern.id;
    }

    // Only include promotion if promotion_id is provided
    if (modelIntern.promotion_id !== undefined && modelIntern.promotion_id !== null) {
      apiIntern.promotion = {
        id: modelIntern.promotion_id
      };
    } else if (modelIntern.promotion && modelIntern.promotion.id) {
      // Or if promotion object is provided
      apiIntern.promotion = {
        id: modelIntern.promotion.id
      };
    }

    return apiIntern;
  }

  public getInterns(): Promise<Intern[]> {
    return this.apiService.get<any>(this.apiUrl)
      .then(response => {
        // Check if response has the expected structure with stagiaireDtos
        if (response && response.data && response.data.stagiaireDtos && Array.isArray(response.data.stagiaireDtos)) {
          return response.data.stagiaireDtos.map((intern: any) => this.mapApiInternToModel(intern));
        }

        // Fallback to previous format (direct array in data)
        if (response && response.data && Array.isArray(response.data)) {
          return response.data.map((intern: any) => this.mapApiInternToModel(intern));
        }

        console.error('Error: API response is not in expected format', response);
        return [];
      })
      .catch(error => {
        console.error('Error fetching interns:', error);
        return [];
      });
  }

  /**
   * Get an intern by ID
   * @param id The intern ID
   * @returns Promise with the intern
   */
  public getInternById(id: number): Promise<Intern | null> {
    return this.apiService.get<any>(`${this.apiUrl}/${id}`)
      .then(response => {
        // Check if response has the expected structure with stagiaireDtos
        if (response && response.data && response.data.stagiaireDtos) {
          // Handle both array and single object cases
          if (Array.isArray(response.data.stagiaireDtos) && response.data.stagiaireDtos.length > 0) {
            return this.mapApiInternToModel(response.data.stagiaireDtos[0]);
          } else {
            return this.mapApiInternToModel(response.data.stagiaireDtos);
          }
        }

        // Fallback to previous format
        if (response && response.data) {
          return this.mapApiInternToModel(response.data);
        }

        console.error(`Error fetching intern ${id}: Invalid response format`, response);
        return null;
      })
      .catch(error => {
        console.error(`Error fetching intern ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new intern
   * @param intern The intern data
   * @returns Promise with the created intern
   */
  public createIntern(intern: Omit<Intern, 'id'>): Promise<Intern | null> {
    // Convert from model format to API format
    const apiIntern = this.mapModelInternToApi(intern);

    return this.apiService.post<any>(this.apiUrl, apiIntern)
      .then(response => {
        // Check if response has the expected structure with stagiaireDtos
        if (response && response.data && response.data.stagiaireDtos) {
          // Handle both array and single object cases
          if (Array.isArray(response.data.stagiaireDtos) && response.data.stagiaireDtos.length > 0) {
            return this.mapApiInternToModel(response.data.stagiaireDtos[0]);
          } else {
            return this.mapApiInternToModel(response.data.stagiaireDtos);
          }
        }

        // Fallback to previous format
        if (response && response.data) {
          return this.mapApiInternToModel(response.data);
        }

        console.error('Error creating intern: Invalid response format', response);
        return null;
      })
      .catch(error => {
        console.error('Error creating intern:', error);
        return null;
      });
  }

  /**
   * Update an intern
   * @param id The intern ID
   * @param intern The intern data
   * @returns Promise with the updated intern
   */
  public updateIntern(id: number, intern: Partial<Intern>): Promise<Intern | null> {
    // Convert from model format to API format
    const apiIntern = this.mapModelInternToApi(intern);

    return this.apiService.put<any>(`${this.apiUrl}/${id}`, apiIntern)
      .then(response => {
        // Check if response has the expected structure with stagiaireDtos
        if (response && response.data && response.data.stagiaireDtos) {
          // Handle both array and single object cases
          if (Array.isArray(response.data.stagiaireDtos) && response.data.stagiaireDtos.length > 0) {
            return this.mapApiInternToModel(response.data.stagiaireDtos[0]);
          } else {
            return this.mapApiInternToModel(response.data.stagiaireDtos);
          }
        }

        // Fallback to previous format
        if (response && response.data) {
          return this.mapApiInternToModel(response.data);
        }

        console.error(`Error updating intern ${id}: Invalid response format`, response);
        return null;
      })
      .catch(error => {
        console.error(`Error updating intern ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete an intern
   * @param id The intern ID
   * @returns Promise with success status
   */
  public deleteIntern(id: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting intern ${id}:`, error);
        return false;
      });
  }

  /**
   * Get interns by promotion ID
   * @param promotionId The promotion ID
   * @returns Promise with the interns
   */
  public getInternsByPromotionId(promotionId: number): Promise<Intern[]> {
    return this.apiService.get<any>(`${this.apiUrl}/promotion/${promotionId}`)
      .then(response => {
        // Check if response has the expected structure with stagiaireDtos
        if (response && response.data && response.data.stagiaireDtos && Array.isArray(response.data.stagiaireDtos)) {
          return response.data.stagiaireDtos.map((intern: any) => this.mapApiInternToModel(intern));
        }

        // Fallback to previous format
        if (response && response.data && Array.isArray(response.data)) {
          return response.data.map((intern: any) => this.mapApiInternToModel(intern));
        }

        console.error(`Error fetching interns for promotion ${promotionId}: Invalid response format`, response);
        return [];
      })
      .catch(error => {
        console.error(`Error fetching interns for promotion ${promotionId}:`, error);
        return [];
      });
  }
}
