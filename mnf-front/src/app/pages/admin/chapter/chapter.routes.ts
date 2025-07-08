import { Routes } from '@angular/router';

import { ChapterFormComponent } from './chapter-form/chapter-form';
import { ChapterDetailComponent } from './chapter-detail/chapter-detail';
import { ListContainerComponent } from '../list-container/list-container';

export const CHAPTER_ROUTES: Routes = [
  // Use the created components
  { path: '', component: ListContainerComponent },
  { path: 'create', component: ChapterFormComponent },
  { path: 'edit/:id', component: ChapterFormComponent },
  { path: ':id', component: ChapterDetailComponent }
];
