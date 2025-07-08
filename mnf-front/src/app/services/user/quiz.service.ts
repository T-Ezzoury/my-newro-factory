import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { Quiz, QuizQuestion } from '../../models/user/Quiz';
import { BehaviorSubject, Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Injectable({
  providedIn: 'root'
})
export class QuizService {
  private readonly apiUrl = '/api/quizzes';

  // BehaviorSubject to store the current quiz
  private currentQuizSubject: BehaviorSubject<Quiz | null> = new BehaviorSubject<Quiz | null>(null);
  public currentQuiz$: Observable<Quiz | null> = this.currentQuizSubject.asObservable();

  constructor(
    private apiService: ApiService,
    private authService: AuthService
  ) {}

  /**
   * Get all quizzes for the current user
   * @returns Promise with the quizzes
   */
  public getQuizzes(): Promise<Quiz[]> {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      console.error('User not authenticated');
      return Promise.resolve([]);
    }

    return this.apiService.get<Quiz[]>(`${this.apiUrl}/user/${currentUser.id}`)
      .then(response => {
        if (response && response.data) {
          return response.data;
        }
        return [];
      })
      .catch(error => {
        console.error('Error fetching user quizzes:', error);
        return [];
      });
  }

  /**
   * Get the count of quizzes
   * @returns Promise with the count
   */
  public getQuizCount(): Promise<number> {
    return this.apiService.get<number>(`${this.apiUrl}/count`)
      .then(response => {
        if (response && response.data) {
          return response.data;
        }
        return 0;
      })
      .catch(error => {
        console.error('Error fetching quiz count:', error);
        return 0;
      });
  }

  /**
   * Get quizzes by user ID
   * @param userId The user ID
   * @returns Promise with the quizzes
   */
  public getQuizzesByUser(userId: number): Promise<Quiz[]> {
    return this.apiService.get<Quiz[]>(`${this.apiUrl}/user/${userId}`)
      .then(response => {
        if (response && response.data) {
          return response.data;
        }
        return [];
      })
      .catch(error => {
        console.error(`Error fetching quizzes for user ${userId}:`, error);
        return [];
      });
  }

  /**
   * Search quizzes by name
   * @param name The name to search for
   * @returns Promise with the quizzes
   */
  public searchQuizzes(name: string): Promise<Quiz[]> {
    return this.apiService.get<Quiz[]>(`${this.apiUrl}/search`, { params: { name } })
      .then(response => {
        if (response && response.data) {
          return response.data;
        }
        return [];
      })
      .catch(error => {
        console.error(`Error searching quizzes with name ${name}:`, error);
        return [];
      });
  }

  /**
   * Get a quiz by ID
   * @param quizId The quiz ID
   * @returns Promise with the quiz
   */
  public getQuizById(quizId: number): Promise<Quiz | null> {
    return this.apiService.get<Quiz>(`${this.apiUrl}/${quizId}`)
      .then(response => {
        if (response && response.data) {
          return response.data;
        }
        return null;
      })
      .catch(error => {
        console.error(`Error fetching quiz ${quizId}:`, error);
        return null;
      });
  }

  /**
   * Get quiz questions for a quiz
   * @param quizId The quiz ID
   * @returns Promise with the quiz questions
   */
  public getQuizQuestions(quizId: number): Promise<QuizQuestion[]> {
    return this.apiService.get<QuizQuestion[]>(`${this.apiUrl}/${quizId}/questions`)
      .then(response => {
        if (response && response.data) {
          return response.data;
        }
        return [];
      })
      .catch(error => {
        console.error(`Error fetching questions for quiz ${quizId}:`, error);
        return [];
      });
  }

  /**
   * Create a new quiz
   * @param quiz The quiz data
   * @returns Promise with the created quiz
   */
  public createQuiz(quiz: Omit<Quiz, 'id'>): Promise<Quiz | null> {
    // Ensure userId is set
    if (!quiz.userId && this.authService.currentUserValue) {
      quiz = { ...quiz, userId: this.authService.currentUserValue.id };
    }

    return this.apiService.post<Quiz>(this.apiUrl, quiz)
      .then(response => {
        if (response && response.data) {
          // Update current quiz if successful
          this.setCurrentQuiz(response.data);
          return response.data;
        }
        return null;
      })
      .catch(error => {
        console.error('Error creating quiz:', error);
        return null;
      });
  }

  /**
   * Update a quiz
   * @param quizId The quiz ID
   * @param quiz The quiz data
   * @returns Promise with the updated quiz
   */
  public updateQuiz(quizId: number, quiz: Partial<Quiz>): Promise<Quiz | null> {
    return this.apiService.put<Quiz>(`${this.apiUrl}/${quizId}`, quiz)
      .then(response => {
        if (response && response.data) {
          // Update current quiz if it's the one being updated
          const currentQuiz = this.currentQuizSubject.getValue();
          if (currentQuiz && currentQuiz.id === quizId) {
            this.setCurrentQuiz(response.data);
          }
          return response.data;
        }
        return null;
      })
      .catch(error => {
        console.error(`Error updating quiz ${quizId}:`, error);
        return null;
      });
  }

  /**
   * Delete a quiz
   * @param quizId The quiz ID
   * @returns Promise with success status
   */
  public deleteQuiz(quizId: number): Promise<boolean> {
    return this.apiService.delete(`${this.apiUrl}/${quizId}`)
      .then(() => {
        // Clear current quiz if it's the one being deleted
        const currentQuiz = this.currentQuizSubject.getValue();
        if (currentQuiz && currentQuiz.id === quizId) {
          this.setCurrentQuiz(null);
        }
        return true;
      })
      .catch(error => {
        console.error(`Error deleting quiz ${quizId}:`, error);
        return false;
      });
  }

  /**
   * Set the current quiz
   * @param quiz The quiz to set as current
   */
  public setCurrentQuiz(quiz: Quiz | null): void {
    this.currentQuizSubject.next(quiz);
  }

  /**
   * Create an empty quiz with default values
   * @param name The quiz name
   * @param description The quiz description
   * @returns Promise with the created quiz
   */
  public createEmptyQuiz(name: string, description?: string): Promise<Quiz | null> {
    if (!this.authService.currentUserValue) {
      console.error('User not authenticated');
      return Promise.resolve(null);
    }

    const quiz: Omit<Quiz, 'id'> = {
      name,
      description: description || '',
      userId: this.authService.currentUserValue.id
    };

    return this.createQuiz(quiz);
  }
}
