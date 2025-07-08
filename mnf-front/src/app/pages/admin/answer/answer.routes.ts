import { Routes } from '@angular/router';
import { AnswerFormComponent } from './answer-form/answer-form';
import { AnswerDetailComponent } from './answer-detail/answer-detail';
import { ListContainerComponent } from '../list-container/list-container';

export const ANSWER_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  { path: 'create', component: AnswerFormComponent },
  { path: 'edit/:id', component: AnswerFormComponent },
  { path: ':id', component: AnswerDetailComponent }
];
