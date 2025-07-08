import { Component, OnInit, PLATFORM_ID, Inject, Output, EventEmitter } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { MaterialModules } from '../../../material/material';

@Component({
  selector: 'app-theme-toggle',
  standalone: true,
  imports: [CommonModule, MaterialModules],
  templateUrl: './theme-toggle.html',
  styleUrl: './theme-toggle.css'
})
export class ThemeToggleComponent implements OnInit {
  isDarkMode = false;
  @Output() themeChanged = new EventEmitter<boolean>();

  constructor(@Inject(PLATFORM_ID) private platformId: Object) {}

  ngOnInit(): void {
    if (isPlatformBrowser(this.platformId)) {
      // Always set light theme as default on first load
      if (!localStorage.getItem('theme')) {
        localStorage.setItem('theme', 'light');
      }

      // Check for saved theme preference
      const savedTheme = localStorage.getItem('theme');
      if (savedTheme === 'dark') {
        this.isDarkMode = true;
        this.applyTheme(true);
      } else {
        // Default to light mode for any other value or if no value is set
        this.isDarkMode = false;
        this.applyTheme(false);
      }

      // We don't need to listen for system preference changes since we always default to light mode
      // But we'll keep the listener for future reference, just not apply the changes
      const darkModeMediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
      darkModeMediaQuery.addEventListener('change', (e) => {
        // We only apply the theme if the user has explicitly set it to follow system
        // For now, we're defaulting to light mode regardless of system preference
        if (localStorage.getItem('theme') === 'system') {
          this.isDarkMode = e.matches;
          this.applyTheme(e.matches);
        }
      });

      // Force a refresh of the theme after a short delay to ensure all components are initialized
      // Always ensure light theme is applied by default
      setTimeout(() => {
        if (!this.isDarkMode) {
          document.documentElement.setAttribute('data-theme', 'light');
        }
        this.applyTheme(this.isDarkMode);
      }, 100);
    }
  }

  toggleTheme(): void {
    this.isDarkMode = !this.isDarkMode;
    this.applyTheme(this.isDarkMode);
    this.themeChanged.emit(this.isDarkMode);

    if (isPlatformBrowser(this.platformId)) {
      localStorage.setItem('theme', this.isDarkMode ? 'dark' : 'light');
    }
  }

  private applyTheme(isDark: boolean): void {
    if (isPlatformBrowser(this.platformId)) {
      if (isDark) {
        document.documentElement.setAttribute('data-theme', 'dark');
      } else {
        document.documentElement.setAttribute('data-theme', 'light');
      }
    }
  }
}
