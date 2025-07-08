import { Component, OnInit, ElementRef, ViewChildren, QueryList, AfterViewInit } from '@angular/core';
import { RouterOutlet, Router, ActivatedRoute, NavigationEnd } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModules } from '../../../material/material';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [RouterOutlet, CommonModule, MaterialModules],
  templateUrl: './dashboard.html',
  styleUrl: './dashboard.css'
})
export class AdminDashboardComponent implements OnInit, AfterViewInit {
  // Navigation links for the CRUD tabs
  navLinks = [
    { label: 'Promotions', path: '/admin/dashboard/promotions' },
    { label: 'Interns', path: '/admin/dashboard/interns' },
    { label: 'Chapters', path: '/admin/dashboard/chapters' },
    { label: 'Questions', path: '/admin/dashboard/questions' },
    { label: 'Answers', path: '/admin/dashboard/answers' },
    { label: 'Admins', path: '/admin/dashboard/admins' },
    { label: 'Users', path: '/admin/dashboard/users' }
  ];

  @ViewChildren('sliderItem') sliderItems!: QueryList<ElementRef>;

  activeLink: string = '';
  ballPosition: number = 0; // Position of the ball in percentage
  ballWidth: number = 0; // Width of the ball in pixels
  activeItemIndex: number = 0;

  constructor(private router: Router, private activatedRoute: ActivatedRoute) {}

  ngOnInit() {
    // Set the initial active link based on the current route
    this.setActiveLink(this.router.url);

    // Update active link when route changes
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe((event: any) => {
      this.setActiveLink(event.url);
    });
  }

  ngAfterViewInit() {
    // Initial calculation of ball width
    setTimeout(() => {
      this.updateBallWidth();
    });

    // Listen for changes to the slider items
    this.sliderItems.changes.subscribe(() => {
      this.updateBallWidth();
    });
  }

  updateBallWidth() {
    if (this.sliderItems && this.sliderItems.length > 0) {
      // Use the new method to calculate both position and width
      this.calculateBallPositionAndWidth(this.activeItemIndex);
    }
  }

  setActiveLink(url: string) {
    // Find the matching nav link for the current URL
    const matchingLink = this.navLinks.find(link => url.includes(link.path));
    if (matchingLink) {
      this.activeLink = matchingLink.path;
      // Set ball position based on the active link index
      const index = this.navLinks.findIndex(link => link.path === matchingLink.path);
      if (index !== -1) {
        this.moveBall(index);
      }
    } else {
      // Default to the first link if no match is found
      this.activeLink = this.navLinks[0].path;
      this.moveBall(0);
    }
  }

  navigateTo(path: string) {
    this.router.navigate([path]);
  }

  moveBall(index: number) {
    // Update active item index
    this.activeItemIndex = index;

    // Update ball width and position if slider items are available
    if (this.sliderItems && this.sliderItems.length > 0) {
      setTimeout(() => {
        this.calculateBallPositionAndWidth(index);
      });
    } else {
      // Fallback to percentage-based calculation if items aren't available yet
      const itemCount = this.navLinks.length;
      if (itemCount > 0) {
        this.ballPosition = (index / (itemCount - 1)) * 100;
      } else {
        this.ballPosition = 0;
      }
    }
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
