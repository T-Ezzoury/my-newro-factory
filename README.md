# My Newro Factory Monorepo

This repository combines three projects that make up the Newro Factory application:

- **`db-newro-factory`** – MySQL database with initial data and scripts.
- **`newro-factory`** – Spring based backend application.
- **`mnf-front`** – Angular 20 frontend.

A top level `docker-compose.yml` file allows you to run all parts together with a single command.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

Build and start the database, backend and frontend containers:

```bash
docker compose up --build
```

The services will be available at:

- Backend: [http://localhost:8080/qlf](http://localhost:8080/qlf)
- Frontend: [http://localhost:4200](http://localhost:4200)
- MySQL: `localhost:33006` (username `adminnewro`, password `Qwerty1234`)

To stop the stack:

```bash
docker compose down
```

Each sub‑project still contains its own README with additional details.

