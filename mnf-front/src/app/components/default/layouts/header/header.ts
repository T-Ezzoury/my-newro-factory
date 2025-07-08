import { Component, Input, ViewChild, AfterViewInit, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { MaterialModules } from '../../../../material/material';
import { ThemeToggleComponent } from '../../../shared/theme-toggle/theme-toggle';
import { MatSidenav } from '@angular/material/sidenav';
import { LanguageService, Language } from '../../../../services/language.service';
import { TranslatePipe } from '../../../../pipes/translate.pipe';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-header',
  imports: [RouterLink, MaterialModules, ThemeToggleComponent, TranslatePipe, CommonModule],
  templateUrl: './header.html',
  standalone: true,
  styleUrl: './header.css'
})
export class Header implements AfterViewInit, OnInit {
  @Input() navLinks: { label: string, path: string }[] = [];
  @ViewChild('sidenav') sidenav!: MatSidenav;
  sidenavOpened = false;
  isDarkMode = false;
  languages: Language[] = [];
  currentLanguage: Language;

  constructor(private languageService: LanguageService) {
    this.currentLanguage = this.languageService.getCurrentLanguage();
  }

  ngOnInit() {
    this.languages = this.languageService.getLanguages();
  }

  ngAfterViewInit() {
    // Add a slight delay to ensure the sidenav is properly initialized
    setTimeout(() => {
      // Sidenav should be initialized if needed
    }, 100);
  }

  toggleSidenav() {
    // Simply toggle the sidenavOpened property
    this.sidenavOpened = !this.sidenavOpened;

    // If the sidenav is now open, we need to initialize it after the view is updated
    if (this.sidenavOpened) {
      // Use setTimeout to ensure the sidenav is rendered before trying to access it
      setTimeout(() => {
        // Sidenav should be initialized if needed
      }, 100);
    }
  }

  changeLanguage(langCode: string) {
    this.languageService.setLanguage(langCode);
  }

  onThemeChanged(isDarkMode: boolean): void {
    this.isDarkMode = isDarkMode;
  }
}
