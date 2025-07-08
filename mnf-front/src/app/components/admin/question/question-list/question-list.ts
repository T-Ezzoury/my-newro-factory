import { Component, OnInit, Input, Output, EventEmitter, OnChanges, SimpleChanges } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { QuestionService } from '../../../../services/admin/question.service';
import { Question } from '../../../../models/admin/Question';

@Component({
  selector: 'app-question-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './question-list.html',
  styleUrl: './question-list.css'
})
export class QuestionListComponent implements OnInit, OnChanges {
  questions: Question[] = [];
  loading = true;
  error = '';

  // Pagination inputs from parent
  @Input() currentPage = 1;
  @Input() pageSize = 10;

  // Pagination outputs to parent
  @Output() paginationChange = new EventEmitter<{totalItems: number, totalPages: number}>();

  // Calculated pagination values
  totalPages = 0;

  // Make Math available in the template
  Math = Math;

  constructor(private questionService: QuestionService) {}

  ngOnInit(): void {
    this.loadQuestions();
  }

  ngOnChanges(changes: SimpleChanges): void {
    // React to changes in pagination inputs
    if (changes['currentPage'] && !changes['currentPage'].firstChange) {
      // No need to reload data, just update the view
      console.log('Current page changed to:', this.currentPage);
    }
  }

  loadQuestions(): void {
    this.loading = true;
    this.error = '';

    this.questionService.getQuestions()
      .then(questions => {
        this.questions = questions;
        this.calculateTotalPages();
        this.loading = false;
      })
      .catch(err => {
        this.error = 'Failed to load questions. Please try again.';
        this.loading = false;
        console.error('Error loading questions:', err);
      });
  }

  calculateTotalPages(): void {
    this.totalPages = Math.ceil(this.questions.length / this.pageSize);
    // Emit pagination info to parent component
    this.paginationChange.emit({
      totalItems: this.questions.length,
      totalPages: this.totalPages
    });
  }

  get paginatedQuestions(): Question[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    return this.questions.slice(startIndex, endIndex);
  }

  deleteQuestion(id: number): void {
    if (confirm('Are you sure you want to delete this question?')) {
      this.questionService.deleteQuestion(id)
        .then(success => {
          if (success) {
            this.questions = this.questions.filter(question => question.id !== id);
            this.calculateTotalPages();
          } else {
            this.error = 'Failed to delete question. Please try again.';
          }
        })
        .catch(err => {
          this.error = 'Failed to delete question. Please try again.';
          console.error('Error deleting question:', err);
        });
    }
  }
}
