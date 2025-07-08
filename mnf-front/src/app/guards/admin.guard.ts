import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AdminGuard implements CanActivate {

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean {
    // First check if the user is authenticated
    if (!this.authService.isAuthenticated()) {
      // Store the attempted URL for redirecting after login
      const returnUrl = state.url;

      // Navigate to the login page with a return URL
      this.router.navigate(['/auth'], {
        queryParams: { returnUrl }
      });

      return false;
    }

    // Then check if the user is an admin
    if (this.authService.isAdmin()) {
      return true;
    }

    // If the user is authenticated but not an admin, redirect to home page
    this.router.navigate(['/']);
    return false;
  }
}
