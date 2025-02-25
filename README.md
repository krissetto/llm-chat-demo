# Running the Project with Docker

This section provides instructions to build and run the project using Docker.

## Prerequisites

- Ensure Docker and Docker Compose are installed on your system.
- Python version 3.9 is used in the Dockerfile.

## Build and Run Instructions

1. Build the Docker image and start the service using Docker Compose:

   ```bash
   docker-compose up --build
   ```

2. The application will start and run as defined in the `chat.py` script.

## Configuration

- The `requirements.txt` file is used to install Python dependencies.
- Uncomment the `env_file` line in the `docker-compose.yml` file if environment variables are required.

## Networking

- The application is connected to the `app_network` network defined in the `docker-compose.yml` file.

For further details, refer to the provided Dockerfiles and Compose file.