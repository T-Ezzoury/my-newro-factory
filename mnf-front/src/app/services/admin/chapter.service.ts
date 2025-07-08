import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { Chapter } from '../../models/admin/Chapter';

@Injectable({
  providedIn: 'root'
})
export class ChapterService {
  private readonly apiUrl = '/api/chapters';

  constructor(private apiService: ApiService) {}

  /**
   * Maps API response to Chapter model
   * @param apiChapter The chapter data from API
   * @returns Chapter model
   */
  private mapApiResponseToChapter(apiChapter: any): Chapter {
    // Create a new chapter object with the API data
    const chapter: Chapter = {
      id: apiChapter.id,
      name: apiChapter.name || apiChapter.titre || '',
      title: apiChapter.titre || apiChapter.title || '',
      path: apiChapter.path || '',
      content: apiChapter.content || '',
      // Handle parent data which can be null, empty array, or populated array
      parent_path: apiChapter.parent_path || '',
      parentPath: apiChapter.parentPath || '',
      parents: apiChapter.parents
    };

    return chapter;
  }

  /**
   * Get all chapters
   * @returns Promise with the chapters
   */
  public getChapters(): Promise<Chapter[]> {
    return this.apiService.get<any[]>(this.apiUrl)
      .then(response => {
        if (Array.isArray(response.data)) {
          return response.data.map(chapter => this.mapApiResponseToChapter(chapter));
        }
        console.error('Unexpected API response format:', response);
        return [];
      })
      .catch(error => {
        console.error('Error fetching chapters:', error);
        return [];
      });
  }

  /**
   * Get a chapter by ID
   * @param id The chapter ID
   * @returns Promise with the chapter
   */
  public getChapterById(id: number): Promise<Chapter | null> {
    return this.apiService.get<any>(`${this.apiUrl}/${id}`)
      .then(response => {
        if (response.data) {
          return this.mapApiResponseToChapter(response.data);
        }
        return null;
      })
      .catch(error => {
        console.error(`Error fetching chapter ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new chapter
   * @param chapter The chapter data
   * @returns Promise with the created chapter
   */
  public createChapter(chapter: Omit<Chapter, 'id'>): Promise<Chapter | null> {
    return this.apiService.post<any>(this.apiUrl, chapter)
      .then(response => {
        if (response.data) {
          return this.mapApiResponseToChapter(response.data);
        }
        return null;
      })
      .catch(error => {
        console.error('Error creating chapter:', error);
        return null;
      });
  }

  /**
   * Update a chapter
   * @param id The chapter ID
   * @param chapter The chapter data
   * @returns Promise with the updated chapter
   */
  public updateChapter(id: number, chapter: Partial<Chapter>): Promise<Chapter | null> {
    return this.apiService.put<any>(`${this.apiUrl}/${id}`, chapter)
      .then(response => {
        if (response.data) {
          return this.mapApiResponseToChapter(response.data);
        }
        return null;
      })
      .catch(error => {
        console.error(`Error updating chapter ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete a chapter
   * @param id The chapter ID
   * @returns Promise with success status
   */
  public deleteChapter(id: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting chapter ${id}:`, error);
        return false;
      });
  }

  /**
   * Get chapters by parent path
   * @param parentPath The parent path
   * @returns Promise with the chapters
   */
  public getChaptersByParentPath(parentPath: string): Promise<Chapter[]> {
    return this.apiService.get<any[]>(`${this.apiUrl}/parent/${parentPath}`)
      .then(response => {
        if (Array.isArray(response.data)) {
          return response.data.map(chapter => this.mapApiResponseToChapter(chapter));
        }
        console.error('Unexpected API response format:', response);
        return [];
      })
      .catch(error => {
        console.error(`Error fetching chapters for parent path ${parentPath}:`, error);
        return [];
      });
  }
}
