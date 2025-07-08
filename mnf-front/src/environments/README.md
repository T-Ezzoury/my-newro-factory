# Environment Configuration for Axios

This directory contains environment configuration files for different environments (local, dev, preprod, production). These configurations are used by the Axios-based API service to make requests to the appropriate API endpoints based on the current environment.

## Environment Files

- `environment.ts` - Default environment configuration (used during development)
- `environment.local.ts` - Local environment configuration
- `environment.dev.ts` - Development environment configuration
- `environment.preprod.ts` - Pre-production environment configuration
- `environment.prod.ts` - Production environment configuration

Each environment file exports an object with the following properties:

```typescript
export const environment = {
  production: boolean,  // Whether this is a production environment
  name: string,         // The name of the environment
  apiBaseUrl: string    // The base URL for API requests
};
```

## Using Environment Configuration with Axios

The project includes an `EnvironmentService` that manages the current environment configuration and an `ApiService` that uses Axios to make HTTP requests with the appropriate base URL.

### Installing Axios

Before using the API service, you need to install Axios. You can do this by running the provided script:

```bash
# Make the script executable
chmod +x src/environments/install-axios.sh

# Run the script
./src/environments/install-axios.sh
```

Alternatively, you can install Axios manually:

```bash
npm install axios
```

### EnvironmentService

The `EnvironmentService` provides methods to get and set the current environment:

```typescript
import { EnvironmentService } from './services/environment.service';

constructor(private environmentService: EnvironmentService) {}

// Get the current environment configuration
const config = this.environmentService.getEnvironment();

// Get the API base URL for the current environment
const apiBaseUrl = this.environmentService.getApiBaseUrl();

// Check if the current environment is production
const isProduction = this.environmentService.isProduction();

// Set the current environment
this.environmentService.setEnvironment('dev');
```

### ApiService

The `ApiService` provides methods to make HTTP requests using Axios:

```typescript
import { ApiService } from './services/api.service';

constructor(private apiService: ApiService) {}

// Make a GET request
this.apiService.get('/users')
  .then(response => {
    // Handle response
  })
  .catch(error => {
    // Handle error
  });

// Make a POST request
this.apiService.post('/users', { name: 'John', email: 'john@example.com' })
  .then(response => {
    // Handle response
  })
  .catch(error => {
    // Handle error
  });

// Change the environment
this.apiService.setEnvironment('preprod');
```

## Environment Switcher Component

The project includes an `EnvironmentSwitcherComponent` that demonstrates how to use the environment configuration with Axios. You can access this component at the `/environment` route.

The component allows you to:

1. View the current environment configuration
2. Switch between different environments
3. Test API requests with the current environment

## Adding a New Environment

To add a new environment:

1. Create a new environment file (e.g., `environment.staging.ts`) with the appropriate configuration
2. Update the `EnvironmentService` to include the new environment:

```typescript
// Add the import
import { environment as stagingEnvironment } from '../../environments/environment.staging';

// Update the Environment type
export type Environment = 'default' | 'local' | 'dev' | 'preprod' | 'production' | 'staging';

// Update the environmentMap
private environmentMap: Record<Environment, EnvironmentConfig> = {
  default: defaultEnvironment,
  local: localEnvironment,
  dev: devEnvironment,
  preprod: preprodEnvironment,
  production: prodEnvironment,
  staging: stagingEnvironment
};
```

## Building for Different Environments

To build the application for a specific environment, you would typically use Angular's build configurations in `angular.json`. However, since this project uses a runtime environment switching mechanism, you can build the application once and switch environments at runtime.

For a more traditional approach, you would configure the `angular.json` file to use different environment files for different build configurations.
