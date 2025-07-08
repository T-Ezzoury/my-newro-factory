import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DragDropModule, CdkDragDrop, transferArrayItem } from '@angular/cdk/drag-drop';

import { ChapterService } from '../../../services/admin/chapter.service';
import { QuestionService } from '../../../services/admin/question.service';
import { QuestionSeriesService } from '../../../services/user/question-series.service';
import { AuthService } from '../../../services/auth.service';

import { Chapter } from '../../../models/admin/Chapter';
import { Question } from '../../../models/admin/Question';
import { QuestionSeries, QuestionSeriesItem } from '../../../models/user/QuestionSeries';

@Component({
  selector: 'app-question-series',
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
    DragDropModule
  ],
  templateUrl: './question-series.html',
  styleUrl: './question-series.css'
})
export class QuestionSeriesPage implements OnInit {
  // Data
  chapters: Chapter[] = [];
  questions: { [chapterId: number]: Question[] } = {};
  selectedChapter: Chapter | null = null;
  currentSeries: QuestionSeries | null = null;
  seriesItems: QuestionSeriesItem[] = [];

  // UI state
  loadingChapters = false;
  loadingQuestions = false;
  loadingSeries = false;
  seriesName = '';
  seriesDescription = '';

  // Error messages
  chapterError = '';
  questionError = '';
  seriesError = '';

  constructor(
    private chapterService: ChapterService,
    private questionService: QuestionService,
    private questionSeriesService: QuestionSeriesService,
    private authService: AuthService,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    this.loadChapters();

    // Subscribe to current series changes
    this.questionSeriesService.currentSeries$.subscribe(series => {
      this.currentSeries = series;
      if (series) {
        this.seriesName = series.name;
        this.seriesDescription = series.description || '';
        this.loadSeriesItems();
      } else {
        this.seriesItems = [];
      }
    });
  }

  /**
   * Load all chapters
   */
  loadChapters(): void {
    this.loadingChapters = true;
    this.chapterError = '';

    this.chapterService.getChapters()
      .then(chapters => {
        this.chapters = chapters;
        this.loadingChapters = false;
      })
      .catch(error => {
        this.chapterError = 'Failed to load chapters';
        this.loadingChapters = false;
        console.error('Error loading chapters:', error);
      });
  }

  /**
   * Load questions for a chapter
   */
  loadQuestionsForChapter(chapter: Chapter): void {
    if (this.questions[chapter.id!]) {
      // Questions already loaded
      this.selectedChapter = chapter;
      return;
    }

    this.loadingQuestions = true;
    this.questionError = '';
    this.selectedChapter = chapter;

    this.questionService.getQuestionsByChapterId(chapter.id!)
      .then(questions => {
        this.questions[chapter.id!] = questions;
        this.loadingQuestions = false;
      })
      .catch(error => {
        this.questionError = 'Failed to load questions';
        this.loadingQuestions = false;
        console.error('Error loading questions:', error);
      });
  }

  /**
   * Load items for the current series
   */
  loadSeriesItems(): void {
    if (!this.currentSeries) return;

    this.loadingSeries = true;
    this.seriesError = '';
    this.seriesItems = [];

    // Load questions for each question ID in the series
    const promises = this.currentSeries.questions.map(questionId =>
      this.questionService.getQuestionById(questionId)
    );

    Promise.all(promises)
      .then(questions => {
        // Filter out null values and map to series items
        this.seriesItems = questions
          .filter(q => q !== null)
          .map(q => ({
            questionId: q!.id!,
            title: q!.title,
            statement: q!.statement,
            chapterId: q!.chapter_id,
            chapterName: q!.chapter?.name
          }));
        this.loadingSeries = false;
      })
      .catch(error => {
        this.seriesError = 'Failed to load series items';
        this.loadingSeries = false;
        console.error('Error loading series items:', error);
      });
  }

  /**
   * Create a new empty series
   */
  createNewSeries(): void {
    if (!this.seriesName.trim()) {
      this.snackBar.open('Please enter a series name', 'Close', { duration: 3000 });
      return;
    }

    this.loadingSeries = true;
    this.seriesError = '';

    this.questionSeriesService.createEmptySeries(this.seriesName, this.seriesDescription)
      .then(series => {
        if (series) {
          this.snackBar.open('Series created successfully', 'Close', { duration: 3000 });
        } else {
          this.seriesError = 'Failed to create series';
        }
        this.loadingSeries = false;
      })
      .catch(error => {
        this.seriesError = 'Failed to create series';
        this.loadingSeries = false;
        console.error('Error creating series:', error);
      });
  }

  /**
   * Update the current series
   */
  updateSeries(): void {
    if (!this.currentSeries) return;

    if (!this.seriesName.trim()) {
      this.snackBar.open('Please enter a series name', 'Close', { duration: 3000 });
      return;
    }

    this.loadingSeries = true;

    const updatedSeries = {
      ...this.currentSeries,
      name: this.seriesName,
      description: this.seriesDescription
    };

    this.questionSeriesService.updateQuestionSeries(this.currentSeries.id!, updatedSeries)
      .then(series => {
        if (series) {
          this.snackBar.open('Series updated successfully', 'Close', { duration: 3000 });
        } else {
          this.seriesError = 'Failed to update series';
        }
        this.loadingSeries = false;
      })
      .catch(error => {
        this.seriesError = 'Failed to update series';
        this.loadingSeries = false;
        console.error('Error updating series:', error);
      });
  }

  /**
   * Handle drag and drop of questions
   */
  onQuestionDrop(event: CdkDragDrop<QuestionSeriesItem[]>): void {
    if (!this.currentSeries) {
      this.snackBar.open('Please create a series first', 'Close', { duration: 3000 });
      return;
    }

    if (event.previousContainer === event.container) {
      // Reordering within the same container
      // Not implemented yet
    } else {
      // Moving from questions to series
      const question = event.previousContainer.data[event.previousIndex];

      // Add to series if not already there
      if (!this.seriesItems.some(item => item.questionId === question.questionId)) {
        // Add to UI
        transferArrayItem(
          event.previousContainer.data,
          event.container.data,
          event.previousIndex,
          event.currentIndex,
        );

        // Add to service
        this.questionSeriesService.addQuestionToCurrentSeries(question);
      }
    }
  }

  /**
   * Remove a question from the series
   */
  removeQuestion(questionId: number): void {
    if (!this.currentSeries) return;

    // Remove from UI
    this.seriesItems = this.seriesItems.filter(item => item.questionId !== questionId);

    // Remove from service
    this.questionSeriesService.removeQuestionFromCurrentSeries(questionId);
  }

  /**
   * Get questions for the selected chapter
   */
  get chapterQuestions(): Question[] {
    if (!this.selectedChapter || !this.selectedChapter.id) return [];
    return this.questions[this.selectedChapter.id] || [];
  }

  /**
   * Convert questions to series items for drag and drop
   */
  get chapterQuestionsAsItems(): QuestionSeriesItem[] {
    return this.chapterQuestions.map(q => ({
      questionId: q.id!,
      title: q.title,
      statement: q.statement,
      chapterId: q.chapter_id,
      chapterName: q.chapter?.name
    }));
  }
}
