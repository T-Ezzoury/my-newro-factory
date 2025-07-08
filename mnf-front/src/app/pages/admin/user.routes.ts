import { Routes } from '@angular/router';
import { ListContainerComponent } from './list-container/list-container';
import { UserFormComponent } from './user/user-form/user-form';

export const USER_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  { path: 'create', component: UserFormComponent },
  { path: 'edit/:id', component: UserFormComponent }
];
