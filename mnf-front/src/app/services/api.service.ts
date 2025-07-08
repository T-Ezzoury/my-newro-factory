import { Injectable } from '@angular/core';
import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from 'axios';
import { EnvironmentService } from './environment.service';

interface CacheItem {
  data: any;
  expiry: number;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private axiosInstance: AxiosInstance;
  private cache: Map<string, CacheItem> = new Map();
  private cacheDuration: number = 60000; // Cache duration in milliseconds (1 minute)

  constructor(private environmentService: EnvironmentService) {
    // Create Axios instance with default configuration
    this.axiosInstance = axios.create({
      baseURL: this.environmentService.getApiBaseUrl(),
      timeout: 10000,
      withCredentials: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // Add cache control headers to reduce OPTIONS preflight requests
        'Cache-Control': 'max-age=3600',
        'Pragma': 'no-cache'
      }
    });

    // Configure Axios to handle CORS preflight requests
    this.axiosInstance.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

    // Add headers that help reduce preflight requests
    // These simple headers don't trigger preflight
    this.axiosInstance.defaults.headers.common['Accept-Language'] = 'en-US,en;q=0.9';

    // Update baseURL when environment changes
    this.environmentService.currentEnvironment$.subscribe(env => {
      this.axiosInstance.defaults.baseURL = env.apiBaseUrl;
      console.log(`API baseURL updated to: ${env.apiBaseUrl}`);

      // Clear the cache when environment changes to ensure fresh data
      this.clearCache();
    });

    // Add request interceptor for authentication, logging, etc.
    this.axiosInstance.interceptors.request.use(
      (config) => {
        // Add authentication token to headers if available
        const token = localStorage.getItem('auth_token');
        if (token) {
          config.headers.Authorization = `Bearer ${token}`;
        }

        // Add cache-related headers to help with preflight caching
        // Only add these headers for GET requests to avoid unnecessary preflight for simple requests
        if (config.method?.toLowerCase() === 'get') {
          // These headers help the browser cache the preflight response
          config.headers['Access-Control-Max-Age'] = '86400'; // Cache preflight for 24 hours
        }

        return config;
      },
      (error) => {
        return Promise.reject(error);
      }
    );

    // Add response interceptor for error handling, data transformation, etc.
    this.axiosInstance.interceptors.response.use(
      (response) => {
        // You can transform response data here if needed
        return response;
      },
      (error) => {
        // Check if this is a CORS error
        if (error.message === 'Network Error' ||
            (error.response && error.response.status === 0) ||
            error.message.includes('CORS')) {
          console.error('CORS Error:', error.message);
          console.error('This might be a Cross-Origin Resource Sharing (CORS) issue.');
          console.error('Please ensure the server is configured to allow requests from this origin.');
        } else {
          // Handle other errors globally
          console.error('API Error:', error);
        }
        return Promise.reject(error);
      }
    );
  }

  /**
   * Make a GET request
   * @param url The URL to request
   * @param config Optional Axios request configuration
   * @param useCache Whether to use cache for this request (default: true)
   * @returns Promise with the response
   */
  public get<T = any>(url: string, config?: AxiosRequestConfig, useCache: boolean = true): Promise<AxiosResponse<T>> {
    // Generate a cache key based on the URL and any query parameters
    const cacheKey = this.getCacheKey(url, config);

    // Check if we should use cache and if we have a valid cached response
    if (useCache && this.cache.has(cacheKey)) {
      const cachedItem = this.cache.get(cacheKey)!;

      // Check if the cached item is still valid
      if (cachedItem.expiry > Date.now()) {
        console.log(`Using cached response for: ${url}`);
        // Return the cached response as a resolved promise
        return Promise.resolve(cachedItem.data);
      } else {
        // Remove expired item from cache
        this.cache.delete(cacheKey);
      }
    }

    // If no cache or expired, make the actual request
    return this.axiosInstance.get<T>(url, config).then(response => {
      // Cache the response if caching is enabled
      if (useCache) {
        this.cache.set(cacheKey, {
          data: response,
          expiry: Date.now() + this.cacheDuration
        });
      }
      return response;
    });
  }

  /**
   * Make a POST request
   * @param url The URL to request
   * @param data The data to send
   * @param config Optional Axios request configuration
   * @param invalidateCache Whether to invalidate related cache entries (default: true)
   * @returns Promise with the response
   */
  public post<T = any>(url: string, data?: any, config?: AxiosRequestConfig, invalidateCache: boolean = true): Promise<AxiosResponse<T>> {
    return this.axiosInstance.post<T>(url, data, config).then(response => {
      // Invalidate related cache entries after successful POST
      if (invalidateCache) {
        this.invalidateRelatedCache(url);
      }
      return response;
    });
  }

  /**
   * Make a PUT request
   * @param url The URL to request
   * @param data The data to send
   * @param config Optional Axios request configuration
   * @param invalidateCache Whether to invalidate related cache entries (default: true)
   * @returns Promise with the response
   */
  public put<T = any>(url: string, data?: any, config?: AxiosRequestConfig, invalidateCache: boolean = true): Promise<AxiosResponse<T>> {
    return this.axiosInstance.put<T>(url, data, config).then(response => {
      // Invalidate related cache entries after successful PUT
      if (invalidateCache) {
        this.invalidateRelatedCache(url);
      }
      return response;
    });
  }

  /**
   * Make a DELETE request
   * @param url The URL to request
   * @param config Optional Axios request configuration
   * @param invalidateCache Whether to invalidate related cache entries (default: true)
   * @returns Promise with the response
   */
  public delete<T = any>(url: string, config?: AxiosRequestConfig, invalidateCache: boolean = true): Promise<AxiosResponse<T>> {
    return this.axiosInstance.delete<T>(url, config).then(response => {
      // Invalidate related cache entries after successful DELETE
      if (invalidateCache) {
        this.invalidateRelatedCache(url);
      }
      return response;
    });
  }

  /**
   * Make a PATCH request
   * @param url The URL to request
   * @param data The data to send
   * @param config Optional Axios request configuration
   * @param invalidateCache Whether to invalidate related cache entries (default: true)
   * @returns Promise with the response
   */
  public patch<T = any>(url: string, data?: any, config?: AxiosRequestConfig, invalidateCache: boolean = true): Promise<AxiosResponse<T>> {
    return this.axiosInstance.patch<T>(url, data, config).then(response => {
      // Invalidate related cache entries after successful PATCH
      if (invalidateCache) {
        this.invalidateRelatedCache(url);
      }
      return response;
    });
  }

  /**
   * Invalidate cache entries related to the given URL
   * @param url The URL that was modified
   */
  private invalidateRelatedCache(url: string): void {
    // Extract the base resource path from the URL
    // For example, from '/api/users/123', extract '/api/users'
    const urlParts = url.split('/');
    const resourcePath = urlParts.slice(0, urlParts.length - (url.endsWith('/') ? 0 : 1)).join('/');

    // Find and remove all cache entries that start with the resource path
    const keysToRemove: string[] = [];

    this.cache.forEach((_, key) => {
      if (key === resourcePath || key.startsWith(`${resourcePath}/`) || key.startsWith(`${resourcePath}?`)) {
        keysToRemove.push(key);
      }
    });

    // Remove the identified cache entries
    keysToRemove.forEach(key => {
      this.cache.delete(key);
      console.log(`Invalidated cache for: ${key}`);
    });
  }

  /**
   * Get the Axios instance for custom requests
   * @returns The Axios instance
   */
  public getAxiosInstance(): AxiosInstance {
    return this.axiosInstance;
  }

  /**
   * Change the environment at runtime
   * @param env The environment to set
   */
  public setEnvironment(env: 'default' | 'local' | 'dev' | 'preprod' | 'production'): void {
    // Clear the cache when changing environments to ensure fresh data
    this.clearCache();
    this.environmentService.setEnvironment(env);
  }

  /**
   * Make an OPTIONS request (useful for CORS preflight)
   * @param url The URL to request
   * @param config Optional Axios request configuration
   * @returns Promise with the response
   */
  public options<T = any>(url: string, config?: AxiosRequestConfig): Promise<AxiosResponse<T>> {
    return this.axiosInstance.options<T>(url, config);
  }

  /**
   * Generate a cache key based on the URL and request configuration
   * @param url The URL of the request
   * @param config The request configuration
   * @returns A string that can be used as a cache key
   */
  private getCacheKey(url: string, config?: AxiosRequestConfig): string {
    if (!config || !config.params) {
      return url;
    }

    // Sort the params to ensure consistent cache keys regardless of param order
    const sortedParams = Object.keys(config.params)
      .sort()
      .map(key => `${key}=${config.params[key]}`)
      .join('&');

    return `${url}?${sortedParams}`;
  }

  /**
   * Clear the entire cache
   */
  public clearCache(): void {
    this.cache.clear();
    console.log('API cache cleared');
  }

  /**
   * Clear a specific item from the cache
   * @param url The URL to clear from cache
   * @param config The request configuration
   */
  public clearCacheItem(url: string, config?: AxiosRequestConfig): void {
    const cacheKey = this.getCacheKey(url, config);
    if (this.cache.has(cacheKey)) {
      this.cache.delete(cacheKey);
      console.log(`Cleared cache for: ${url}`);
    }
  }
}
