import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

export interface Language {
  code: string;
  name: string;
  flag: string;
}

@Injectable({
  providedIn: 'root'
})
export class LanguageService {
  // Available languages
  private languages: Language[] = [
    { code: 'fr', name: 'Français', flag: 'fr' },
    { code: 'en', name: 'English', flag: 'gb' }
  ];

  // Default language is French
  private currentLanguageSubject = new BehaviorSubject<Language>(this.languages[0]);

  constructor() {
    // Check if there's a stored language preference
    const storedLang = localStorage.getItem('language');
    if (storedLang) {
      const lang = this.languages.find(l => l.code === storedLang);
      if (lang) {
        this.currentLanguageSubject.next(lang);
      }
    }
  }

  // Get all available languages
  getLanguages(): Language[] {
    return this.languages;
  }

  // Get the current language
  getCurrentLanguage(): Language {
    return this.currentLanguageSubject.value;
  }

  // Get the current language as an observable
  getCurrentLanguage$(): Observable<Language> {
    return this.currentLanguageSubject.asObservable();
  }

  // Change the current language
  setLanguage(langCode: string): void {
    const lang = this.languages.find(l => l.code === langCode);
    if (lang) {
      this.currentLanguageSubject.next(lang);
      localStorage.setItem('language', lang.code);
      // Reload the page to apply the language change
      window.location.reload();
    }
  }
}
