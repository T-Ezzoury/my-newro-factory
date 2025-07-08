import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-answer-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="answer-list-container">
      <h1 class="list-title" i18n="@@answersTitle">Answers</h1>
      <p class="placeholder-text" i18n="@@answersPlaceholder">
        This is a placeholder for the Answers list. The actual component will be implemented soon.
      </p>
      <a routerLink="/admin" class="back-button" i18n="@@backToAdmin">
        Back to Admin Dashboard
      </a>
    </div>
  `,
  styles: [`
    :host {
      display: block;
    }

    .answer-list-container {
      padding: 1.5rem;
      max-width: 1200px;
      margin: 0 auto;
    }

    .list-title {
      font-size: 1.875rem;
      font-weight: 700;
      color: #ffffff;
      margin-bottom: 1.5rem;
    }

    .placeholder-text {
      color: #d1d5db;
      margin-bottom: 1rem;
      font-size: 1rem;
      line-height: 1.5;
    }

    .back-button {
      display: inline-block;
      background-color: #3b82f6;
      color: white;
      font-weight: 700;
      padding: 0.5rem 1rem;
      border-radius: 0.375rem;
      text-decoration: none;
      transition: background-color 0.2s;
    }

    .back-button:hover {
      background-color: #2563eb;
    }
  `]
})
export class AnswerListComponent {
  // This is a placeholder component

  // Pagination inputs from parent
  @Input() currentPage = 1;
  @Input() pageSize = 10;

  // Pagination outputs to parent
  @Output() paginationChange = new EventEmitter<{totalItems: number, totalPages: number}>();
}
