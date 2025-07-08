import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-question-detail',
  standalone: true,
  imports: [CommonModule, RouterLink],
  template: `
    <div class="p-4">
      <h1 class="text-3xl font-bold mb-6" i18n="@@questionDetailTitle">Question Detail</h1>
      <p class="text-gray-300 mb-4" i18n="@@questionDetailPlaceholder">
        This is a placeholder for the Question detail view. The actual component will be implemented soon.
      </p>
      <a routerLink="/admin/questions" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded transition duration-200" i18n="@@backToQuestions">
        Back to Questions
      </a>
    </div>
  `,
  styles: [`
    :host {
      display: block;
    }
  `]
})
export class QuestionDetailComponent {
  // This is a placeholder component
}
