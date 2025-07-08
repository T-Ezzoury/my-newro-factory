#!/bin/bash

# Exit on error
set -e

echo "=== Newro Factory Application Runner ==="
echo "Building and starting the application..."

# Build and start the containers in detached mode
docker compose up --build -d

echo "Application is starting..."
echo "It will be available at http://localhost:8080/qlf"
echo "Use the following command to view logs:"
echo "  docker-compose logs -f"
echo "To stop the application, run:"echo "  docker-compose down"
