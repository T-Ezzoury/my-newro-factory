import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-answer-form',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="list-container">
      <div class="list-header border-rad">
        <div class="header-left">
          <h2 class="list-title">
            <i class="material-icons header-icon">question_answer</i>
            Answer Form
          </h2>
          <p class="form-subtitle" i18n="@@answerFormPlaceholder">
            This is a placeholder for the Answer form. The actual component will be implemented soon.
          </p>
        </div>
        <div class="header-right">
          <a routerLink="/admin/dashboard/answers" class="add-button">
            <span class="material-icons add-icon">arrow_back</span>
            Back to Answers
          </a>
          <div class="container-behind"></div>
        </div>
      </div>
      <div class="list-content">
        <p>The answer form will be available in a future update.</p>
      </div>
    </div>
  `,
  styleUrl: '../../list-container/list-container.css'
})
export class AnswerFormComponent {
  // This is a placeholder component
}
