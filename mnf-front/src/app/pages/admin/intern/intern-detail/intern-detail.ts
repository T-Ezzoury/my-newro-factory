import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Intern } from '../../../../models/admin/Intern';
import { InternService } from '../../../../services/admin/intern.service';
import { PromotionService } from '../../../../services/admin/promotion.service';
import { Promotion } from '../../../../models/admin/Promotion';

@Component({
  selector: 'app-intern-detail',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './intern-detail.html',
})
export class InternDetailComponent implements OnInit {
  intern: Intern | null = null;
  promotion: Promotion | null = null;
  loading = true;
  error = '';

  constructor(
    private internService: InternService,
    private promotionService: PromotionService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.loadIntern(+id);
    } else {
      this.error = 'Intern ID is required';
      this.loading = false;
    }
  }

  loadIntern(id: number): void {
    this.loading = true;
    this.internService.getInternById(id)
      .then(intern => {
        if (intern) {
          this.intern = intern;
          if (intern.promotion_id) {
            this.loadPromotion(intern.promotion_id);
          } else {
            this.loading = false;
          }
        } else {
          this.error = 'Intern not found';
          this.loading = false;
        }
      })
      .catch(error => {
        this.error = 'Failed to load intern. Please try again.';
        this.loading = false;
        console.error('Error loading intern:', error);
      });
  }

  loadPromotion(promotionId: number): void {
    this.promotionService.getPromotionById(promotionId)
      .then(promotion => {
        this.promotion = promotion;
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load promotion. Please try again.';
        this.loading = false;
        console.error('Error loading promotion:', error);
      });
  }

  deleteIntern(): void {
    if (!this.intern || !this.intern.id) return;

    if (confirm('Are you sure you want to delete this intern?')) {
      this.loading = true;
      this.internService.deleteIntern(this.intern.id)
        .then(success => {
          if (success) {
            this.router.navigate(['/admin/interns']);
          } else {
            this.error = 'Failed to delete intern. Please try again.';
            this.loading = false;
          }
        })
        .catch(error => {
          this.error = 'Failed to delete intern. Please try again.';
          this.loading = false;
          console.error('Error deleting intern:', error);
        });
    }
  }
}
