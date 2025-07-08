import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-answer-detail',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="p-4">
      <h1 class="text-3xl font-bold mb-6" i18n="@@answerDetailTitle">Answer Detail</h1>
      <p class="text-gray-300 mb-4" i18n="@@answerDetailPlaceholder">
        This is a placeholder for the Answer detail view. The actual component will be implemented soon.
      </p>
      <a routerLink="/admin/answers" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded transition duration-200" i18n="@@backToAnswers">
        Back to Answers
      </a>
    </div>
  `,
  styles: [`
    :host {
      display: block;
    }
  `]
})
export class AnswerDetailComponent {
  // This is a placeholder component
}
