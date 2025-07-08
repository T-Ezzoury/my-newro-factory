import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';
import { ErrorHandler } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ErrorHandlerService implements ErrorHandler {
  private isInitialized = false;
  private initTimeout: any;

  constructor(private router: Router) {
    // Set a timeout to mark the application as initialized after 3 seconds
    // This will prevent redirecting to error page during initialization
    this.initTimeout = setTimeout(() => {
      this.isInitialized = true;
      console.log('Application marked as initialized');
    }, 3000);
  }

  handleError(error: any): void {
    // Log the error
    console.error('Error occurred:', error);

    // Don't redirect during initialization phase
    if (!this.isInitialized) {
      console.warn('Error during initialization, not redirecting to error page');
      return;
    }

    // Handle HTTP errors
    if (error instanceof HttpErrorResponse) {
      switch (error.status) {
        case 404:
          this.router.navigate(['/404']);
          break;
        case 500:
          this.router.navigate(['/error'], {
            queryParams: { code: '500' }
          });
          break;
        default:
          this.router.navigate(['/error'], {
            queryParams: { code: error.status || 'unknown' }
          });
          break;
      }
    } else {
      // Handle client-side errors
      this.router.navigate(['/error'], {
        queryParams: { code: 'client' }
      });
    }
  }
}
