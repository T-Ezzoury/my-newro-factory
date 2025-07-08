import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MaterialModules } from '../../../../material/material';
import { LanguageService, Language } from '../../../../services/language.service';
import { TranslatePipe } from '../../../../pipes/translate.pipe';
import { ThemeToggleComponent } from '../../../shared/theme-toggle/theme-toggle';
import { AuthService } from '../../../../services/auth.service';

@Component({
  selector: 'app-admin-header',
  imports: [RouterLink, MaterialModules, TranslatePipe, CommonModule, ThemeToggleComponent],
  templateUrl: './header.html',
  standalone: true,
  styleUrl: './header.css'
})
export class Header implements OnInit {
  @Output() toggleSidenavEvent = new EventEmitter<void>();
  @Output() themeChanged = new EventEmitter<boolean>();
  languages: Language[] = [];
  currentLanguage: Language;
  isDarkMode = true; // Default to dark mode for admin
  sidenavOpened = false; // Track sidenav state

  // Admin navigation links
  navLinks = [
    { label: 'Promotions', path: '/admin/promotions' },
    { label: 'Interns', path: '/admin/interns' },
    { label: 'Chapters', path: '/admin/chapters' },
    { label: 'Questions', path: '/admin/questions' },
    { label: 'Answers', path: '/admin/answers' }
  ];

  constructor(
    private authService: AuthService,
    private languageService: LanguageService
  ) {
    this.currentLanguage = this.languageService.getCurrentLanguage();
  }

  ngOnInit() {
    this.languages = this.languageService.getLanguages();
  }

  toggleSidenav() {
    this.sidenavOpened = !this.sidenavOpened;
    this.toggleSidenavEvent.emit();
  }

  changeLanguage(langCode: string) {
    this.languageService.setLanguage(langCode);
  }

  onThemeChanged(isDarkMode: boolean): void {
    this.isDarkMode = isDarkMode;
    // Apply theme to the admin layout
    document.documentElement.setAttribute('data-theme', isDarkMode ? 'dark' : 'light');
    // Emit the theme changed event to the parent component
    this.themeChanged.emit(isDarkMode);
  }

  logout(): void {
    this.authService.logout();
  }
}
