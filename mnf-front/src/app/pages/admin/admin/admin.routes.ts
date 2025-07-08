import { Routes } from '@angular/router';
import { ListContainerComponent } from '../list-container/list-container';

export const ADMIN_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  // We can add more routes later if needed, such as:
  // { path: 'create', component: AdminFormComponent },
  // { path: 'edit/:id', component: AdminFormComponent },
  // { path: ':id', component: AdminDetailComponent }
];
