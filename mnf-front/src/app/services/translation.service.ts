import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, shareReplay } from 'rxjs/operators';
import { LanguageService } from './language.service';

@Injectable({
  providedIn: 'root'
})
export class TranslationService {
  private translations: { [key: string]: any } = {};
  private translationCache: { [lang: string]: Observable<any> } = {};

  constructor(
    private http: HttpClient,
    private languageService: LanguageService
  ) {}

  // Load translations for a specific language
  loadTranslations(lang: string): Observable<any> {
    if (this.translationCache[lang]) {
      return this.translationCache[lang];
    }

    this.translationCache[lang] = this.http.get(`/assets/i18n/${lang}.json`).pipe(
      map(response => {
        this.translations[lang] = response;
        return response;
      }),
      catchError(error => {
        console.error(`Error loading translations for ${lang}:`, error);
        return of({});
      }),
      shareReplay(1)
    );

    return this.translationCache[lang];
  }

  // Get a translation by key
  translate(key: string): string {
    const currentLang = this.languageService.getCurrentLanguage().code;

    if (!this.translations[currentLang]) {
      return key; // Return the key if translations aren't loaded yet
    }

    // Split the key by dots to navigate the nested JSON structure
    const keys = key.split('.');
    let value = this.translations[currentLang];

    // Navigate through the nested structure
    for (const k of keys) {
      if (value && value[k] !== undefined) {
        value = value[k];
      } else {
        return key; // Return the key if the translation is not found
      }
    }

    return typeof value === 'string' ? value : key;
  }

  // Initialize translations for the current language
  initTranslations(): Observable<any> {
    const currentLang = this.languageService.getCurrentLanguage().code;
    return this.loadTranslations(currentLang);
  }
}
