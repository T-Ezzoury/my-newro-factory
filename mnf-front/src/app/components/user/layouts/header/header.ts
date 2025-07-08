import {
  Component,
  Input,
  OnInit,
  ViewChild,
  AfterViewInit,
} from "@angular/core";
import { RouterLink, Router } from "@angular/router";
import { MaterialModules } from "../../../../material/material";
import {
  LanguageService,
  Language,
} from "../../../../services/language.service";
import { TranslatePipe } from "../../../../pipes/translate.pipe";
import { CommonModule } from "@angular/common";
import { ThemeToggleComponent } from "../../../shared/theme-toggle/theme-toggle";
import { MatSidenav } from "@angular/material/sidenav";
import { AuthService } from "../../../../services/auth.service";

@Component({
  selector: "app-header",
  imports: [
    RouterLink,
    MaterialModules,
    TranslatePipe,
    CommonModule,
    ThemeToggleComponent,
  ],
  templateUrl: "./header.html",
  standalone: true,
  styleUrl: "./header.css",
})
export class Header implements OnInit, AfterViewInit {
  @Input() navLinks: { label: string; path: string }[] = [];
  @ViewChild("sidenav") sidenav!: MatSidenav;
  sidenavOpened = false;
  languages: Language[] = [];
  currentLanguage: Language;
  isDarkMode = false;
  isAuthenticated = false;
  isAdmin = false;

  constructor(
    private languageService: LanguageService,
    private authService: AuthService,
    private router: Router
  ) {
    this.currentLanguage = this.languageService.getCurrentLanguage();
  }

  logout(): void {
    this.authService.logout();
  }

  ngOnInit() {
    this.languages = this.languageService.getLanguages();
    this.isAuthenticated = this.authService.isAuthenticated();
    this.isAdmin = this.authService.isAdmin();

    // Subscribe to auth changes
    this.authService.currentUser$.subscribe(() => {
      this.isAuthenticated = this.authService.isAuthenticated();
      this.isAdmin = this.authService.isAdmin();
    });
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
