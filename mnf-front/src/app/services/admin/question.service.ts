import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { Question } from '../../models/admin/Question';

@Injectable({
  providedIn: 'root'
})
export class QuestionService {
  private readonly apiUrl = '/api/questions';

  constructor(private apiService: ApiService) {
  }

  /**
   * Get all questions
   * @returns Promise with the questions
   */
  public getQuestions(): Promise<Question[]> {
    return this.apiService.get<Question[]>(this.apiUrl)
      .then(response => response.data)
      .catch(error => {
        console.error('Error fetching questions:', error);
        return [];
      });
  }

  /**
   * Get a question by ID
   * @param id The question ID
   * @returns Promise with the question
   */
  public getQuestionById(id: number): Promise<Question | null> {
    return this.apiService.get<Question>(`${this.apiUrl}/${id}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching question ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new question
   * @param question The question data
   * @returns Promise with the created question
   */
  public createQuestion(question: Omit<Question, 'id'>): Promise<Question | null> {
    return this.apiService.post<Question>(this.apiUrl, question)
      .then(response => response.data)
      .catch(error => {
        console.error('Error creating question:', error);
        return null;
      });
  }

  /**
   * Update a question
   * @param id The question ID
   * @param question The question data
   * @returns Promise with the updated question
   */
  public updateQuestion(id: number, question: Partial<Question>): Promise<Question | null> {
    return this.apiService.put<Question>(`${this.apiUrl}/${id}`, question)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error updating question ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete a question
   * @param id The question ID
   * @returns Promise with success status
   */
  public deleteQuestion(id: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${id}`)
      .then(() => true)
      .catch(error => {
        console.error(`Error deleting question ${id}:`, error);
        return false;
      });
  }

  /**
   * Get questions by chapter ID
   * @param chapterId The chapter ID
   * @returns Promise with the questions
   */
  public getQuestionsByChapterId(chapterId: number): Promise<Question[]> {
    return this.apiService.get<Question[]>(`${this.apiUrl}/chapter/${chapterId}`)
      .then(response => response.data)
      .catch(error => {
        console.error(`Error fetching questions for chapter ${chapterId}:`, error);
        return [];
      });
  }
}
