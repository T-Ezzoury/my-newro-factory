import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Promotion } from '../../../../models/admin/Promotion';
import { PromotionService } from '../../../../services/admin/promotion.service';
import { NotificationService } from '../../../../services/notification.service';

@Component({
  selector: 'app-promotion-form',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './promotion-form.html',
  styleUrl: '../../list-container/list-container.css'
})
export class PromotionFormComponent implements OnInit {
  promotion: Promotion = {
    name: ''
  };
  isEdit = false;
  loading = false;
  error = '';
  success = '';

  constructor(
    private promotionService: PromotionService,
    private route: ActivatedRoute,
    private router: Router,
    private notificationService: NotificationService
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEdit = true;
      this.loadPromotion(+id);
    }
  }

  loadPromotion(id: number): void {
    this.loading = true;
    this.promotionService.getPromotionById(id)
      .then(promotion => {
        if (promotion) {
          this.promotion = promotion;
        } else {
          this.error = 'Promotion not found';
          this.notificationService.error('Promotion not found');
        }
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load promotion. Please try again.';
        this.notificationService.error('Failed to load promotion. Please try again.');
        this.loading = false;
        console.error('Error loading promotion:', error);
      });
  }

  savePromotion(): void {
    this.loading = true;
    this.error = '';
    this.success = '';

    const save = this.isEdit
      ? this.promotionService.updatePromotion(this.promotion.id!, this.promotion)
      : this.promotionService.createPromotion(this.promotion);

    save
      .then(result => {
        if (result) {
          const successMessage = `Promotion ${this.isEdit ? 'updated' : 'created'} successfully`;
          this.success = successMessage;
          this.notificationService.success(successMessage);

          if (!this.isEdit) {
            this.promotion = { name: '' };
          }

          // Immediate navigation without delay
          this.router.navigate(['/admin/dashboard/promotions']);
        } else {
          const errorMessage = `Failed to ${this.isEdit ? 'update' : 'create'} promotion. Please try again.`;
          this.error = errorMessage;
          this.notificationService.error(errorMessage);
        }
        this.loading = false;
      })
      .catch(error => {
        const errorMessage = `Failed to ${this.isEdit ? 'update' : 'create'} promotion. Please try again.`;
        this.error = errorMessage;
        this.notificationService.error(errorMessage);
        this.loading = false;
        console.error(`Error ${this.isEdit ? 'updating' : 'creating'} promotion:`, error);
      });
  }
}
