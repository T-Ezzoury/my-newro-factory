import { Routes } from '@angular/router';
import { InternFormComponent } from './intern-form/intern-form';
import { InternDetailComponent } from './intern-detail/intern-detail';
import { ListContainerComponent } from '../list-container/list-container';

export const INTERN_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  { path: 'create', component: InternFormComponent },
  { path: 'edit/:id', component: InternFormComponent },
  { path: ':id', component: InternDetailComponent }
];
