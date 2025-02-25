# Running the Project with Docker

This section provides instructions for setting up and running the project using Docker.

## Requirements

- Docker version 20.10 or higher
- Docker Compose version 1.29 or higher

## Setup Instructions

1. **Build the Docker Image**

   Run the following command to build the Docker image:

   ```bash
   docker-compose build
   ```

2. **Run the Application**

   Start the application using Docker Compose:

   ```bash
   docker-compose up
   ```

   The application will automatically restart unless stopped manually.

## Configuration

- The application uses a virtual environment for dependency management, which is included in the Docker image.
- If an `.env` file is present, uncomment the `env_file` line in the `docker-compose.yml` file to load environment variables.

## Networking

- The application is connected to the `app_network` bridge network.
- No specific ports are exposed in the provided configuration. Update the `docker-compose.yml` file if port mapping is required.

For further details, refer to the project documentation or contact the development team.