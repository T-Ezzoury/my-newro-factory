import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-test-admin-routes',
  template: '<div>Testing Admin Routes</div>'
})
export class TestAdminRoutesComponent {
  constructor(private router: Router) {
    this.testRoutes();
  }

  async testRoutes() {
    console.log('Testing admin routes...');

    // Test chapter routes
    console.log('Testing chapter routes...');
    try {
      await this.router.navigateByUrl('/admin/chapters');
      console.log('Chapter route navigation successful');
    } catch (error) {
      console.error('Error navigating to chapter route:', error);
    }

    // Test question routes
    console.log('Testing question routes...');
    try {
      await this.router.navigateByUrl('/admin/questions');
      console.log('Question route navigation successful');
    } catch (error) {
      console.error('Error navigating to question route:', error);
    }

    // Test answer routes
    console.log('Testing answer routes...');
    try {
      await this.router.navigateByUrl('/admin/answers');
      console.log('Answer route navigation successful');
    } catch (error) {
      console.error('Error navigating to answer route:', error);
    }

    console.log('Admin routes testing completed');
  }
}
