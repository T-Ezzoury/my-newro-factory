import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment as defaultEnvironment } from '../../environments/environment';
import { environment as localEnvironment } from '../../environments/environment.local';
import { environment as devEnvironment } from '../../environments/environment.dev';
import { environment as preprodEnvironment } from '../../environments/environment.preprod';
import { environment as prodEnvironment } from '../../environments/environment.prod';

export type Environment = 'default' | 'local' | 'dev' | 'preprod' | 'production';

export interface EnvironmentConfig {
  production: boolean;
  name: string;
  apiBaseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class EnvironmentService {
  private environmentMap: Record<Environment, EnvironmentConfig> = {
    default: defaultEnvironment,
    local: localEnvironment,
    dev: devEnvironment,
    preprod: preprodEnvironment,
    production: prodEnvironment
  };

  private currentEnvironmentSubject = new BehaviorSubject<EnvironmentConfig>(this.environmentMap.default);
  public currentEnvironment$: Observable<EnvironmentConfig> = this.currentEnvironmentSubject.asObservable();

  constructor() {
    // Initialize with the default environment
    this.setEnvironment('default');
  }

  /**
   * Set the current environment
   * @param env The environment to set
   */
  public setEnvironment(env: Environment): void {
    if (this.environmentMap[env]) {
      this.currentEnvironmentSubject.next(this.environmentMap[env]);
      console.log(`Environment switched to: ${env}`);
    } else {
      console.error(`Environment ${env} not found`);
    }
  }

  /**
   * Get the current environment configuration
   */
  public getEnvironment(): EnvironmentConfig {
    return this.currentEnvironmentSubject.value;
  }

  /**
   * Get the API base URL for the current environment
   */
  public getApiBaseUrl(): string {
    return this.getEnvironment().apiBaseUrl;
  }

  /**
   * Check if the current environment is production
   */
  public isProduction(): boolean {
    return this.getEnvironment().production;
  }
}
