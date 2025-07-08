import { Routes } from '@angular/router';
import { AdminDashboardComponent } from './dashboard';

export const DASHBOARD_ROUTES: Routes = [
  {
    path: '',
    component: AdminDashboardComponent,
    children: [
      { path: '', redirectTo: 'promotions', pathMatch: 'full' },
      // Keep these routes for detail, create, and edit pages
      { path: 'promotions', loadChildren: () => import('../promotion/promotion.routes').then(m => m.PROMOTION_ROUTES) },
      { path: 'interns', loadChildren: () => import('../intern/intern.routes').then(m => m.INTERN_ROUTES) },
      { path: 'chapters', loadChildren: () => import('../chapter/chapter.routes').then(m => m.CHAPTER_ROUTES) },
      { path: 'questions', loadChildren: () => import('../question/question.routes').then(m => m.QUESTION_ROUTES) },
      { path: 'answers', loadChildren: () => import('../answer/answer.routes').then(m => m.ANSWER_ROUTES) },
      { path: 'admins', loadChildren: () => import('../admin.routes').then(m => m.ADMIN_ROUTES) },
      { path: 'users', loadChildren: () => import('../user.routes').then(m => m.USER_ROUTES) },
    ]
  }
];
