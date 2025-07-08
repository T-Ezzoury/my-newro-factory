import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Intern } from '../../../../models/admin/Intern';
import { InternService } from '../../../../services/admin/intern.service';
import { PromotionService } from '../../../../services/admin/promotion.service';
import { Promotion } from '../../../../models/admin/Promotion';
import { NotificationService } from '../../../../services/notification.service';

@Component({
  selector: 'app-intern-form',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './intern-form.html',
  styleUrl: '../../list-container/list-container.css'
})
export class InternFormComponent implements OnInit {
  intern: Intern = {
    first_name: '',
    last_name: '',
    arrival: null,
    formation_over: null,
    promotion_id: null
  };
  promotions: Promotion[] = [];
  isEdit = false;
  loading = false;
  error = '';
  success = '';

  constructor(
    private internService: InternService,
    private promotionService: PromotionService,
    private route: ActivatedRoute,
    private router: Router,
    private notificationService: NotificationService
  ) {}

  ngOnInit(): void {
    this.loadPromotions();

    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEdit = true;
      this.loadIntern(+id);
    }
  }

  loadIntern(id: number): void {
    this.loading = true;
    this.internService.getInternById(id)
      .then(intern => {
        if (intern) {
          // Convert string dates to Date objects for form inputs
          if (intern.arrival) {
            intern.arrival = new Date(intern.arrival);
          }
          if (intern.formation_over) {
            intern.formation_over = new Date(intern.formation_over);
          }

          // Make sure promotion_id is set if we have a promotion object
          if (intern.promotion && intern.promotion.id && !intern.promotion_id) {
            intern.promotion_id = intern.promotion.id;
          }

          this.intern = intern;
        } else {
          this.error = 'Intern not found';
          this.notificationService.error('Intern not found');
        }
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load intern. Please try again.';
        this.notificationService.error('Failed to load intern. Please try again.');
        this.loading = false;
        console.error('Error loading intern:', error);
      });
  }

  loadPromotions(): void {
    this.promotionService.getPromotions()
      .then(promotions => {
        this.promotions = promotions;
      })
      .catch(error => {
        this.error = 'Failed to load promotions. Please try again.';
        this.notificationService.error('Failed to load promotions. Please try again.');
        console.error('Error loading promotions:', error);
      });
  }

  saveIntern(): void {
    this.loading = true;
    this.error = '';
    this.success = '';

    // Convert date inputs to ISO strings for API
    const internToSave: any = { ...this.intern };
    if (internToSave.arrival instanceof Date) {
      internToSave.arrival = internToSave.arrival.toISOString();
    }
    if (internToSave.formation_over instanceof Date) {
      internToSave.formation_over = internToSave.formation_over.toISOString();
    }

    const save = this.isEdit
      ? this.internService.updateIntern(this.intern.id!, internToSave)
      : this.internService.createIntern(internToSave);

    save
      .then(result => {
        if (result) {
          const successMessage = `Intern ${this.isEdit ? 'updated' : 'created'} successfully`;
          this.success = successMessage;
          this.notificationService.success(successMessage);

          if (!this.isEdit) {
            this.intern = {
              first_name: '',
              last_name: '',
              arrival: null,
              formation_over: null,
              promotion_id: null
            };
          }

          // Navigate back to the list after a short delay
          setTimeout(() => {
            this.router.navigate(['/admin/dashboard/interns']);
          }, 1500);
        } else {
          const errorMessage = `Failed to ${this.isEdit ? 'update' : 'create'} intern. Please try again.`;
          this.error = errorMessage;
          this.notificationService.error(errorMessage);
        }
        this.loading = false;
      })
      .catch(error => {
        const errorMessage = `Failed to ${this.isEdit ? 'update' : 'create'} intern. Please try again.`;
        this.error = errorMessage;
        this.notificationService.error(errorMessage);
        this.loading = false;
        console.error(`Error ${this.isEdit ? 'updating' : 'creating'} intern:`, error);
      });
  }
}
