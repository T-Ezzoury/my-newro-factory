# Newro Factory

## Docker Setup

This project includes Docker and Docker Compose configuration for easy deployment and testing.

### Prerequisites

- Docker
- Docker Compose

### Running the Application

To build and start the application:

```bash
./run.sh
```

This will:
1. Build the Docker image using the Dockerfile
2. Start the container with the correct port mapping
3. Make the application available at http://localhost:8080/qlf

### Stopping the Application

To stop the application:

```bash
./stop.sh
```

### Manual Docker Compose Commands

If you prefer to use Docker Compose directly:

- Build and start: `docker-compose up --build -d`
- View logs: `docker-compose logs -f`
- Stop and remove containers: `docker-compose down`

## Application Structure

This is a multi-module Maven project:

- `core`: Core domain models and utilities
- `persistence`: Database access and entity definitions
- `service`: Business logic services
- `webapp`: Web application and REST API
- `cli`: Command-line interface

## Development

### Building with Maven

To build the project without Docker:

```bash
mvn clean package
```
The WAR file will be generated at `webapp/target/qlf.war`.
