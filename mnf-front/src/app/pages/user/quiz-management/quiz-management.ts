import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialog } from '@angular/material/dialog';


import { QuizService } from '../../../services/user/quiz.service';
import { AuthService } from '../../../services/auth.service';

import { Quiz } from '../../../models/user/Quiz';
import { ConfirmDialogComponent, ConfirmDialogData } from '../../../shared/components/confirm-dialog/confirm-dialog.component';



@Component({
  selector: 'app-quiz-management',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatButtonModule,
    MatIconModule,
    MatInputModule,
    MatFormFieldModule,
    MatExpansionModule,
    MatListModule,
    MatCardModule,
    MatDividerModule,
    MatProgressSpinnerModule,
    MatTooltipModule
  ],
  templateUrl: './quiz-management.html',
  styleUrl: './quiz-management.css'
})
export class QuizManagementPage implements OnInit {
  // Loading and error states
  loadingQuizzes = false;
  quizzesError = '';

  // Quiz data
  quizzes: Quiz[] = [];

  constructor(
    private quizService: QuizService,
    private authService: AuthService,
    private snackBar: MatSnackBar,
    private dialog: MatDialog,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadQuizzes();
  }

  /**
   * Add a new quiz - redirect to question-series page
   */
  addNewQuiz(): void {
    // Clear any current quiz in the service
    this.quizService.setCurrentQuiz(null);
    // Navigate to question-series page
    this.router.navigate(['/question-series']);
  }





  /**
   * Load all quizzes for the current user
   */
  loadQuizzes(): void {
    if (!this.authService.currentUserValue) {
      this.quizzesError = 'You must be logged in to view quizzes';
      return;
    }

    this.loadingQuizzes = true;
    this.quizzesError = '';

    this.quizService.getQuizzes()
      .then(quizzes => {
        this.quizzes = quizzes;
        this.loadingQuizzes = false;
      })
      .catch(error => {
        this.quizzesError = 'Failed to load quizzes';
        this.loadingQuizzes = false;
        console.error('Error loading quizzes:', error);
      });
  }





  /**
   * Edit a quiz - redirect to question-series page
   */
  editQuiz(quiz: Quiz): void {
    // Set the current quiz in the service for the question-series page
    this.quizService.setCurrentQuiz(quiz);
    // Navigate to question-series page
    this.router.navigate(['/user/question-series']);
  }

  /**
   * Delete a quiz with confirmation dialog
   */
  deleteQuiz(quizId: number): void {
    const quiz = this.quizzes.find(q => q.id === quizId);
    const quizName = quiz ? quiz.name : 'this quiz';

    const dialogData: ConfirmDialogData = {
      title: 'Delete Quiz',
      message: `Are you sure you want to delete "${quizName}"? This action cannot be undone.`,
      confirmText: 'Delete',
      cancelText: 'Cancel'
    };

    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      width: '400px',
      data: dialogData
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result === true) {
        this.performDeleteQuiz(quizId);
      }
    });
  }

  /**
   * Perform the actual quiz deletion
   */
  private performDeleteQuiz(quizId: number): void {
    this.quizService.deleteQuiz(quizId)
      .then(success => {
        if (success) {
          this.snackBar.open('Quiz deleted successfully', 'Close', { duration: 3000 });
          this.loadQuizzes(); // Refresh the list


        } else {
          this.snackBar.open('Failed to delete quiz', 'Close', { duration: 3000 });
        }
      })
      .catch(error => {
        this.snackBar.open('Error deleting quiz', 'Close', { duration: 3000 });
        console.error('Error deleting quiz:', error);
      });
  }

}
