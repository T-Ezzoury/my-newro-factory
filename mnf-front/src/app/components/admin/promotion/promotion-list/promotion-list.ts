import { Component, OnInit, Input, Output, EventEmitter, OnChanges, SimpleChanges } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Promotion } from '../../../../models/admin/Promotion';
import { PromotionService } from '../../../../services/admin/promotion.service';

@Component({
  selector: 'app-promotion-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './promotion-list.html',
  styleUrl: './promotion-list.css'
})
export class PromotionListComponent implements OnInit, OnChanges {
  promotions: Promotion[] = [];
  loading = true;
  error = '';

  // Pagination inputs from parent
  @Input() currentPage = 1;
  @Input() pageSize = 10;

  // Pagination outputs to parent
  @Output() paginationChange = new EventEmitter<{totalItems: number, totalPages: number}>();

  // Calculated pagination values
  totalPages = 0;

  // Make Math available in the template
  Math = Math;

  constructor(private promotionService: PromotionService) {}

  ngOnInit(): void {
    this.loadPromotions();
  }

  ngOnChanges(changes: SimpleChanges): void {
    // React to changes in pagination inputs
    if (changes['currentPage'] && !changes['currentPage'].firstChange) {
      // No need to reload data, just update the view
      console.log('Current page changed to:', this.currentPage);
    }
  }

  loadPromotions(): void {
    this.loading = true;
    this.promotionService.getPromotions()
      .then(promotions => {
        this.promotions = promotions;
        this.calculateTotalPages();
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load promotions. Please try again.';
        this.loading = false;
        console.error('Error loading promotions:', error);
      });
  }

  calculateTotalPages(): void {
    this.totalPages = Math.ceil(this.promotions.length / this.pageSize);
    // Emit pagination info to parent component
    this.paginationChange.emit({
      totalItems: this.promotions.length,
      totalPages: this.totalPages
    });
  }

  get paginatedPromotions(): Promotion[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    return this.promotions.slice(startIndex, endIndex);
  }

  deletePromotion(id: number): void {
    if (confirm('Are you sure you want to delete this promotion?')) {
      this.promotionService.deletePromotion(id)
        .then(success => {
          if (success) {
            this.promotions = this.promotions.filter(p => p.id !== id);
          } else {
            this.error = 'Failed to delete promotion. Please try again.';
          }
        })
        .catch(error => {
          this.error = 'Failed to delete promotion. Please try again.';
          console.error('Error deleting promotion:', error);
        });
    }
  }
}
