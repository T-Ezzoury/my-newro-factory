import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { QuestionSeries, QuestionSeriesItem } from '../../models/user/QuestionSeries';
import { BehaviorSubject, Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Injectable({
  providedIn: 'root'
})
export class QuestionSeriesService {
  private readonly apiUrl = '/api/user/question-series';

  private seriesSubject = new BehaviorSubject<QuestionSeries[]>([]);
  public series$ = this.seriesSubject.asObservable();

  private currentSeriesSubject = new BehaviorSubject<QuestionSeries | null>(null);
  public currentSeries$ = this.currentSeriesSubject.asObservable();

  constructor(
    private apiService: ApiService,
    private authService: AuthService
  ) {}

  /**
   * Get all question series for the current user
   * @returns Promise with the question series
   */
  public getQuestionSeries(): Promise<QuestionSeries[]> {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      return Promise.resolve([]);
    }

    return this.apiService.get<QuestionSeries[]>(`${this.apiUrl}?userId=${currentUser.id}`)
      .then(response => {
        const series = response.data;
        this.seriesSubject.next(series);
        return series;
      })
      .catch(error => {
        console.error('Error fetching question series:', error);
        return [];
      });
  }

  /**
   * Get a question series by ID
   * @param id The question series ID
   * @returns Promise with the question series
   */
  public getQuestionSeriesById(id: number): Promise<QuestionSeries | null> {
    return this.apiService.get<QuestionSeries>(`${this.apiUrl}/${id}`)
      .then(response => {
        const series = response.data;
        this.currentSeriesSubject.next(series);
        return series;
      })
      .catch(error => {
        console.error(`Error fetching question series ${id}:`, error);
        return null;
      });
  }

  /**
   * Create a new question series
   * @param series The question series data
   * @returns Promise with the created question series
   */
  public createQuestionSeries(series: Omit<QuestionSeries, 'id'>): Promise<QuestionSeries | null> {
    return this.apiService.post<QuestionSeries>(this.apiUrl, series)
      .then(response => {
        const newSeries = response.data;

        // Update the series subject with the new series
        const currentSeries = this.seriesSubject.value;
        this.seriesSubject.next([...currentSeries, newSeries]);

        // Set as current series
        this.currentSeriesSubject.next(newSeries);

        return newSeries;
      })
      .catch(error => {
        console.error('Error creating question series:', error);
        return null;
      });
  }

  /**
   * Update a question series
   * @param id The question series ID
   * @param series The question series data
   * @returns Promise with the updated question series
   */
  public updateQuestionSeries(id: number, series: Partial<QuestionSeries>): Promise<QuestionSeries | null> {
    return this.apiService.put<QuestionSeries>(`${this.apiUrl}/${id}`, series)
      .then(response => {
        const updatedSeries = response.data;

        // Update the series subject with the updated series
        const currentSeries = this.seriesSubject.value;
        const updatedSeriesList = currentSeries.map(s =>
          s.id === id ? updatedSeries : s
        );
        this.seriesSubject.next(updatedSeriesList);

        // Update current series if it's the one being edited
        if (this.currentSeriesSubject.value?.id === id) {
          this.currentSeriesSubject.next(updatedSeries);
        }

        return updatedSeries;
      })
      .catch(error => {
        console.error(`Error updating question series ${id}:`, error);
        return null;
      });
  }

  /**
   * Delete a question series
   * @param id The question series ID
   * @returns Promise with success status
   */
  public deleteQuestionSeries(id: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${id}`)
      .then(() => {
        // Update the series subject by removing the deleted series
        const currentSeries = this.seriesSubject.value;
        this.seriesSubject.next(currentSeries.filter(s => s.id !== id));

        // Clear current series if it's the one being deleted
        if (this.currentSeriesSubject.value?.id === id) {
          this.currentSeriesSubject.next(null);
        }

        return true;
      })
      .catch(error => {
        console.error(`Error deleting question series ${id}:`, error);
        return false;
      });
  }

  /**
   * Add a question to the current series
   * @param questionItem The question to add
   */
  public addQuestionToCurrentSeries(questionItem: QuestionSeriesItem): void {
    const currentSeries = this.currentSeriesSubject.value;
    if (!currentSeries) return;

    // Check if question is already in the series
    if (currentSeries.questions.includes(questionItem.questionId)) return;

    // Add question to the series
    const updatedSeries = {
      ...currentSeries,
      questions: [...currentSeries.questions, questionItem.questionId]
    };

    // Update the current series
    this.currentSeriesSubject.next(updatedSeries);

    // Save the updated series
    this.updateQuestionSeries(currentSeries.id!, updatedSeries);
  }

  /**
   * Remove a question from the current series
   * @param questionId The ID of the question to remove
   */
  public removeQuestionFromCurrentSeries(questionId: number): void {
    const currentSeries = this.currentSeriesSubject.value;
    if (!currentSeries) return;

    // Remove question from the series
    const updatedSeries = {
      ...currentSeries,
      questions: currentSeries.questions.filter(id => id !== questionId)
    };

    // Update the current series
    this.currentSeriesSubject.next(updatedSeries);

    // Save the updated series
    this.updateQuestionSeries(currentSeries.id!, updatedSeries);
  }

  /**
   * Set the current question series
   * @param series The question series to set as current
   */
  public setCurrentSeries(series: QuestionSeries | null): void {
    this.currentSeriesSubject.next(series);
  }

  /**
   * Create a new empty question series
   * @param name The name of the series
   * @param description The description of the series
   * @returns Promise with the created question series
   */
  public createEmptySeries(name: string, description?: string): Promise<QuestionSeries | null> {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      return Promise.resolve(null);
    }

    const newSeries: Omit<QuestionSeries, 'id'> = {
      name,
      description,
      userId: currentUser.id,
      questions: []
    };

    return this.createQuestionSeries(newSeries);
  }
}
