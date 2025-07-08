import { Component, ViewChildren, QueryList, ElementRef, AfterViewInit, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MaterialModules } from '../../../../material/material';
import { LoginPage } from '../../../../components/default/auth/login/login';
import { RegisterPage } from '../../../../components/default/auth/register/register';
import { trigger, transition, style, animate } from '@angular/animations';
import { TranslatePipe } from '../../../../pipes/translate.pipe';

@Component({
  selector: 'app-auth-page',
  standalone: true,
  imports: [CommonModule, MaterialModules, LoginPage, RegisterPage, TranslatePipe],
  templateUrl: './auth-page.html',
  styleUrl: './auth-page.css',
  animations: [
    trigger('formAnimation', [
      transition(':enter', [
        style({ opacity: 0, transform: 'translateY(10px)' }),
        animate('300ms ease-out', style({ opacity: 1, transform: 'translateY(0)' }))
      ]),
      transition(':leave', [
        animate('300ms ease-in', style({ opacity: 0, transform: 'translateY(10px)' }))
      ])
    ])
  ]
})
export class AuthPage implements OnInit, AfterViewInit {
  showLogin = true; // Default to showing login form

  @ViewChildren('sliderItem') sliderItems!: QueryList<ElementRef>;

  ballPosition: number = 0; // Position of the ball in percentage
  ballWidth: number = 0; // Width of the ball in pixels

  ngOnInit() {
    // Initialize with login selected
    this.showLogin = true;
  }

  ngAfterViewInit() {
    // Initial calculation of ball width and position
    setTimeout(() => {
      this.updateBallPosition();
    });

    // Listen for changes to the slider items
    this.sliderItems.changes.subscribe(() => {
      this.updateBallPosition();
    });
  }

  updateBallPosition() {
    if (this.sliderItems && this.sliderItems.length > 0) {
      // Calculate ball position and width based on active item
      this.calculateBallPositionAndWidth(this.showLogin ? 0 : 1);
    }
  }

  navigateTo(isLogin: boolean) {
    this.showLogin = isLogin;
    this.calculateBallPositionAndWidth(isLogin ? 0 : 1);
  }

  toggleForm() {
    this.showLogin = !this.showLogin;
    this.calculateBallPositionAndWidth(this.showLogin ? 0 : 1);
  }

  calculateBallPositionAndWidth(index: number) {
    if (!this.sliderItems || this.sliderItems.length === 0) return;

    const trackElement = this.sliderItems.first.nativeElement.parentElement;
    const trackWidth = trackElement.offsetWidth;
    const activeItem = this.sliderItems.get(index)?.nativeElement;

    if (activeItem && trackWidth) {
      // Get the item's position and dimensions
      const itemLeft = activeItem.offsetLeft;
      const itemWidth = activeItem.offsetWidth;

      // Position the ball 4px to the left of the text
      const ballLeft = itemLeft - 4;

      // Calculate ball position as percentage of track width
      this.ballPosition = (ballLeft / trackWidth) * 100;

      // Set the ball width to match the text width plus 8px (4px on each side)
      this.ballWidth = itemWidth + 8;
    }
  }
}
