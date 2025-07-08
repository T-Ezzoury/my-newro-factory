import { ApplicationConfig, APP_INITIALIZER, ErrorHandler, provideBrowserGlobalErrorListeners, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideAnimations } from '@angular/platform-browser/animations';

import { routes } from './app.routes';
import { provideHttpClient } from '@angular/common/http';
import { TranslationService } from './services/translation.service';
import { ErrorHandlerService } from './services/error-handler.service';
import { firstValueFrom } from 'rxjs';

// Factory function to initialize translations
export function initializeApp(translationService: TranslationService) {
  return () => firstValueFrom(translationService.initTranslations());
}

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient(),
    provideAnimations(),
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApp,
      deps: [TranslationService],
      multi: true
    },
    // Custom error handler
    {
      provide: ErrorHandler,
      useClass: ErrorHandlerService
    }
  ]
};
