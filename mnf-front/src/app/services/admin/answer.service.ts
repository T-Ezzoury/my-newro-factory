import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { Answer } from '../../models/admin/Answer';

@Injectable({
  providedIn: 'root'
})
export class AnswerService {
  private readonly apiUrl = '/api/answers';

  constructor(private apiService: ApiService) {}

  /**
   * Get all answers
   * @returns Promise with the answers
   */
  public getAnswers(): Promise<Answer[]> {
    return this.apiService.get<Answer[]>(this.apiUrl)
      .then(response => response.data)
      .catch(error => {
        console.error('Error fetching answers:', error);
        return [];
      });
  }

  /**
   * Get an answer by ID
   * @param id The answer ID
   * @returns Promise with the answer
   */
  public getAnswerById(id: number): Promise<Answer | null> {
    return this.apiService.get<Answer>(`${this.apiUrl}/${id}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching answer ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new answer
   * @param answer The answer data
   * @returns Promise with the created answer
   */
  public createAnswer(answer: Omit<Answer, 'id'>): Promise<Answer | null> {
    return this.apiService.post<Answer>(this.apiUrl, answer)
      .then(response => response.data)
      .catch(error => {
        console.error('Error creating answer:', error);
        return null;
      });
  }

  /**
   * Update an answer
   * @param id The answer ID
   * @param answer The answer data
   * @returns Promise with the updated answer
   */
  public updateAnswer(id: number, answer: Partial<Answer>): Promise<Answer | null> {
    return this.apiService.put<Answer>(`${this.apiUrl}/${id}`, answer)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error updating answer ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete an answer
   * @param id The answer ID
   * @returns Promise with success status
   */
  public deleteAnswer(id: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting answer ${id}:`, error);
        return false;
      });
  }

  /**
   * Get answers by question ID
   * @param questionId The question ID
   * @returns Promise with the answers
   */
  public getAnswersByQuestionId(questionId: number): Promise<Answer[]> {
    return this.apiService.get<Answer[]>(`${this.apiUrl}/question/${questionId}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching answers for question ${questionId}:`, error);
        return [];
      });
  }
}
