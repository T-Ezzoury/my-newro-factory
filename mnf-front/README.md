# MNF-Front

WESH LES AVRILS
This project was generated using [Angular CLI](https://github.com/angular/angular-cli) version 20.0.3.

## Development server

To start a local development server, run:

```bash
ng serve
```

Once the server is running, open your browser and navigate to `http://localhost:4200/`. The application will automatically reload whenever you modify any of the source files.

## Code scaffolding

Angular CLI includes powerful code scaffolding tools. To generate a new component, run:

```bash
ng generate component component-name
```

For a complete list of available schematics (such as `components`, `directives`, or `pipes`), run:

```bash
ng generate --help
```

## Building

To build the project run:

```bash
ng build
```

This will compile your project and store the build artifacts in the `dist/` directory. By default, the production build optimizes your application for performance and speed.

## Running unit tests

To execute unit tests with the [Karma](https://karma-runner.github.io) test runner, use the following command:

```bash
ng test
```

## Running end-to-end tests

For end-to-end (e2e) testing, run:

```bash
ng e2e
```

Angular CLI does not come with an end-to-end testing framework by default. You can choose one that suits your needs.

## Docker Deployment

### Building the Docker Image Locally

To build the Docker image locally:

```bash
docker build -t mnf-front:latest .
```

To run the Docker image locally:

```bash
docker run -p 8080:80 mnf-front:latest
```

Then access the application at http://localhost:8080

## AWS ECR Deployment

### Configuration

Before deploying to AWS ECR, update the `deploy-to-ecr.sh` script with your AWS region:

```bash
# Configuration
AWS_REGION="your-aws-region"  # e.g., eu-west-3 for Paris
ECR_REPOSITORY_NAME="mnf-front"
IMAGE_TAG="latest"
```

### Deployment Steps

1. Make the deployment script executable:

```bash
chmod +x deploy-to-ecr.sh
```

2. Run the deployment script:

```bash
./deploy-to-ecr.sh
```

This script will:
- Authenticate with AWS ECR
- Create the ECR repository if it doesn't exist
- Build the Docker image
- Tag the Docker image
- Push the Docker image to ECR

## Additional Resources

For more information on using the Angular CLI, including detailed command references, visit the [Angular CLI Overview and Command Reference](https://angular.dev/tools/cli) page.
