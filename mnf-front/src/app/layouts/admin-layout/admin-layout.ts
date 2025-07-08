import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Header } from '../../components/admin/layouts/header/header';
import { NotificationComponent } from '../../components/shared/notification/notification.component';

@Component({
  selector: 'app-admin-layout',
  standalone: true,
  imports: [RouterOutlet, CommonModule, Header, NotificationComponent],
  templateUrl: './admin-layout.html',
  styleUrl: './admin-layout.css'
})
export class AdminLayout {
  // State for sidenav
  sidenavOpened = false;

  // Theme state
  isDarkMode = false;

  // Toggle sidenav
  toggleSidenav() {
    this.sidenavOpened = !this.sidenavOpened;
  }

  // Handle theme change events from header
  onThemeChanged(isDark: any) {
    // If it's a boolean, use it directly
    if (typeof isDark === 'boolean') {
      this.isDarkMode = isDark;
    }
    // If it's an event object with a boolean value
    else if (isDark && typeof isDark === 'object' && isDark.hasOwnProperty('target')) {
      // For custom events, the value might be in the detail property
      if (isDark.detail !== undefined) {
        this.isDarkMode = !!isDark.detail;
      }
    }
  }
}
