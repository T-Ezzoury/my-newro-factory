import { Component, Input, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModules } from '../../../../material/material';
import { TranslatePipe } from '../../../../pipes/translate.pipe';
import { AuthService } from '../../../../services/auth.service';

@Component({
  selector: 'app-admin-sidenav',
  imports: [RouterLink, MaterialModules, TranslatePipe, CommonModule],
  templateUrl: './sidenav.html',
  standalone: true,
  styleUrl: './sidenav.css'
})
export class Sidenav implements OnInit {
  @Input() opened = false;

  // Admin navigation links
  navLinks = [
    { label: 'Promotions', path: '/admin/promotions' },
    { label: 'Interns', path: '/admin/interns' },
    { label: 'Chapters', path: '/admin/chapters' },
    { label: 'Questions', path: '/admin/questions' },
    { label: 'Answers', path: '/admin/answers' }
  ];

  constructor(private authService: AuthService) {}

  ngOnInit() {
    // Initialization logic if needed
  }

  close() {
    this.opened = false;
  }

  logout(): void {
    this.authService.logout();
  }
}
