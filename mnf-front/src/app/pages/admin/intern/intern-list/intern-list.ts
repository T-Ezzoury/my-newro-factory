import { Component, OnInit, Input, Output, EventEmitter, OnChanges, SimpleChanges } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Intern } from '../../../../models/admin/Intern';
import { InternService } from '../../../../services/admin/intern.service';
import { PromotionService } from '../../../../services/admin/promotion.service';
import { Promotion } from '../../../../models/admin/Promotion';

@Component({
  selector: 'app-intern-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './intern-list.html',
  styleUrl: './intern-list.css'
})
export class InternListComponent implements OnInit, OnChanges {
  interns: Intern[] = [];
  promotions: Map<number, Promotion> = new Map();
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

  constructor(
    private internService: InternService,
    private promotionService: PromotionService
  ) {}

  ngOnInit(): void {
    this.loadInterns();
  }

  ngOnChanges(changes: SimpleChanges): void {
    // React to changes in pagination inputs
    if (changes['currentPage'] && !changes['currentPage'].firstChange) {
      // No need to reload data, just update the view
      console.log('Current page changed to:', this.currentPage);
    }
  }

  loadInterns(): void {
    this.loading = true;
    this.internService.getInterns()
      .then(interns => {
        this.interns = interns;
        this.calculateTotalPages();
        this.loadPromotions();
      })
      .catch(error => {
        this.error = 'Failed to load interns. Please try again.';
        this.loading = false;
        console.error('Error loading interns:', error);
      });
  }

  calculateTotalPages(): void {
    this.totalPages = Math.ceil(this.interns.length / this.pageSize);
    // Emit pagination info to parent component
    this.paginationChange.emit({
      totalItems: this.interns.length,
      totalPages: this.totalPages
    });
  }

  get paginatedInterns(): Intern[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    return this.interns.slice(startIndex, endIndex);
  }

  loadPromotions(): void {
    // Get unique promotion IDs
    const promotionIds = [...new Set(
      this.interns
        .filter(intern => intern.promotion_id !== null)
        .map(intern => intern.promotion_id!)
    )];

    if (promotionIds.length === 0) {
      this.loading = false;
      return;
    }

    // Load promotions
    Promise.all(
      promotionIds.map(id => this.promotionService.getPromotionById(id))
    )
      .then(promotions => {
        promotions.forEach(promotion => {
          if (promotion && promotion.id) {
            this.promotions.set(promotion.id, promotion);
          }
        });
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load promotions. Some promotion names may not be displayed.';
        this.loading = false;
        console.error('Error loading promotions:', error);
      });
  }

  getPromotionName(promotionId: number | null): string {
    if (promotionId === null) return 'None';
    const promotion = this.promotions.get(promotionId);
    return promotion ? promotion.name : `Promotion ${promotionId}`;
  }

  deleteIntern(id: number): void {
    if (confirm('Are you sure you want to delete this intern?')) {
      this.internService.deleteIntern(id)
        .then(success => {
          if (success) {
            this.interns = this.interns.filter(i => i.id !== id);
          } else {
            this.error = 'Failed to delete intern. Please try again.';
          }
        })
        .catch(error => {
          this.error = 'Failed to delete intern. Please try again.';
          console.error('Error deleting intern:', error);
        });
    }
  }
}
