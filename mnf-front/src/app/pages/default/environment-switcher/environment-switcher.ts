import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatListModule } from '@angular/material/list';
import { MatInputModule } from '@angular/material/input';
import { EnvironmentService, Environment, EnvironmentConfig } from '../../../services/environment.service';
import { UserService } from '../../../services/user.service';

@Component({
  selector: 'app-environment-switcher',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatButtonModule,
    MatCardModule,
    MatFormFieldModule,
    MatSelectModule,
    MatProgressSpinnerModule,
    MatListModule,
    MatInputModule
  ],
  templateUrl: './environment-switcher.html',
  styleUrl: './environment-switcher.css'
})
export class EnvironmentSwitcherComponent implements OnInit {
  environments: Environment[] = ['default', 'local', 'dev', 'preprod', 'production'];
  selectedEnvironment: Environment = 'default';
  currentConfig: EnvironmentConfig | null = null;
  users: any[] = [];
  loading = false;
  error: string | null = null;

  constructor(
    private environmentService: EnvironmentService,
    private userService: UserService
  ) {}

  ngOnInit(): void {
    // Get the current environment configuration
    this.currentConfig = this.environmentService.getEnvironment();

    // Subscribe to environment changes
    this.environmentService.currentEnvironment$.subscribe(config => {
      this.currentConfig = config;
    });
  }

  /**
   * Change the environment
   */
  changeEnvironment(): void {
    this.environmentService.setEnvironment(this.selectedEnvironment);
    this.userService.setEnvironment(this.selectedEnvironment);
    this.fetchUsers();
  }

  /**
   * Fetch users from the API
   */
  fetchUsers(): void {
    this.loading = true;
    this.error = null;

    this.userService.getUsers()
      .then(users => {
        this.users = users;
        this.loading = false;
      })
      .catch(error => {
        //this.error = $localize`:@@errorFetchingUsers:Error fetching users. This is expected if the API is not available.`;
        this.loading = false;
      });
  }
}
