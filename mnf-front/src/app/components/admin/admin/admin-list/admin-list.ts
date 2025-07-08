import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminService } from '../../../../services/admin/admin.service';

@Component({
  selector: 'app-admin-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './admin-list.html',
  styleUrl: './admin-list.css'
})
export class AdminListComponent {
  @Input() currentPage: number = 1;
  @Input() pageSize: number = 10;
  @Output() paginationChange = new EventEmitter<{ totalItems: number, totalPages: number }>();

  admins: any[] = [];
  loading: boolean = true;
  error: string = '';

  constructor(private adminService: AdminService) {}

  ngOnInit(): void {
    this.loadAdmins();
  }

  ngOnChanges(): void {
    this.loadAdmins();
  }

  private loadAdmins(): void {
    this.loading = true;
    this.adminService.getAdmins()
      .then(admins => {
        this.admins = admins;
        this.updatePagination();
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load admins. Please try again.';
        this.loading = false;
        console.error('Error loading admins:', error);
      });
  }

  private updatePagination(): void {
    const totalItems = this.admins.length;
    const totalPages = Math.ceil(totalItems / this.pageSize);
    this.paginationChange.emit({ totalItems, totalPages });
  }
}
