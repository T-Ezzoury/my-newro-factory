import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserService } from '../../../../services/admin/user.service';

@Component({
  selector: 'app-user-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user-list.html',
  styleUrl: './user-list.css'
})
export class UserListComponent {
  @Input() currentPage: number = 1;
  @Input() pageSize: number = 10;
  @Output() paginationChange = new EventEmitter<{ totalItems: number, totalPages: number }>();

  users: any[] = [];
  loading: boolean = true;
  error: string = '';

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  ngOnChanges(): void {
    this.loadUsers();
  }

  private loadUsers(): void {
    this.loading = true;
    this.userService.getUsers()
      .then(users => {
        this.users = users;
        this.updatePagination();
        this.loading = false;
      })
      .catch(error => {
        this.error = 'Failed to load users. Please try again.';
        this.loading = false;
        console.error('Error loading users:', error);
      });
  }

  private updatePagination(): void {
    const totalItems = this.users.length;
    const totalPages = Math.ceil(totalItems / this.pageSize);
    this.paginationChange.emit({ totalItems, totalPages });
  }
}
