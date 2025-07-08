import { Routes } from '@angular/router';
import { PromotionFormComponent } from './promotion-form/promotion-form';
import { PromotionDetailComponent } from './promotion-detail/promotion-detail';
import { ListContainerComponent } from '../list-container/list-container';

export const PROMOTION_ROUTES: Routes = [
  { path: '', component: ListContainerComponent },
  { path: 'create', component: PromotionFormComponent },
  { path: 'edit/:id', component: PromotionFormComponent },
  { path: ':id', component: PromotionDetailComponent }
];
