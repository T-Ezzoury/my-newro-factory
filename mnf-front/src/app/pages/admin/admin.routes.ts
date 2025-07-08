import { Routes } from '@angular/router';
import { ListContainerComponent } from './list-container/list-container';
import { AdminFormComponent } from './admin/admin-form/admin-form';

export const ADMIN_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  { path: 'create', component: AdminFormComponent },
  { path: 'edit/:id', component: AdminFormComponent }
];
