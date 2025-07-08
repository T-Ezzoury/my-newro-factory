import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthPageGuard implements CanActivate {

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean {
    // If user is already authenticated, redirect based on role
    if (this.authService.isAuthenticated()) {
      if (this.authService.isAdmin()) {
        // Redirect admin users to admin dashboard
        this.router.navigate(['/admin/dashboard']);
      } else {
        // Redirect regular users to user homepage
        this.router.navigate(['/']);
      }
      return false;
    }

    // Allow access to auth page for non-authenticated users
    return true;
  }
}
