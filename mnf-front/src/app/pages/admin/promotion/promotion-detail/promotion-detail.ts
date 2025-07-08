import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Promotion } from '../../../../models/admin/Promotion';
import { PromotionService } from '../../../../services/admin/promotion.service';
import { InternService } from '../../../../services/admin/intern.service';
import { Intern } from '../../../../models/admin/Intern';

@Component({
  selector: 'app-promotion-detail',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './promotion-detail.html',
})
export class PromotionDetailComponent implements OnInit {
  promotion: Promotion | null = null;
  interns: Intern[] = [];
  loading = true;
  error = '';

  constructor(
    private promotionService: PromotionService,
    private internService: InternService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.loadPromotion(+id);
    } else {
      this.error = 'Promotion ID is required';
      this.loading = false;
    }
  }

  loadPromotion(id: number): void {
    this.loading = true;
    this.promotionService.getPromotionById(id)
      .then(promotion => {
        if (promotion) {
          this.promotion = promotion;
          this.loadInterns(id);
        } else {
          this.error = 'Promotion not found';
          this.loading = false;
        }
      })
      .catch(error => {
        this.error = 'Failed to load promotion. Please try again.';
        this.loading = false;
        console.error('Error loading promotion:', error);
      });
  }

  loadInterns(promotionId: number): void {
    this.internService.getInternsByPromotionId(promotionId)
      .then(interns => {
        this.interns = interns;
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load interns. Please try again.';
        this.loading = false;
        console.error('Error loading interns:', error);
      });
  }

  deletePromotion(): void {
    if (!this.promotion || !this.promotion.id) return;

    if (confirm('Are you sure you want to delete this promotion?')) {
      this.loading = true;
      this.promotionService.deletePromotion(this.promotion.id)
        .then(success => {
          if (success) {
            this.router.navigate(['/admin/promotions']);
          } else {
            this.error = 'Failed to delete promotion. Please try again.';
            this.loading = false;
          }
        })
        .catch(error => {
          this.error = 'Failed to delete promotion. Please try again.';
          this.loading = false;
          console.error('Error deleting promotion:', error);
        });
    }
  }
}
