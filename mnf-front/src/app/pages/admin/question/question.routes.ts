import { Routes } from '@angular/router';
import { QuestionFormComponent } from './question-form/question-form';
import { QuestionDetailComponent } from './question-detail/question-detail';
import { ListContainerComponent } from '../list-container/list-container';

export const QUESTION_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  { path: 'create', component: QuestionFormComponent },
  { path: 'edit/:id', component: QuestionFormComponent },
  { path: ':id', component: QuestionDetailComponent }
];
