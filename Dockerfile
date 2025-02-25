# syntax=docker/dockerfile:1

# Use a slim Python base image
FROM python:3.9-slim AS base

# Set working directory
WORKDIR /app

# Builder stage for installing dependencies
FROM base AS builder

# Copy requirements file and install dependencies
COPY --link requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip \
    python -m venv .venv && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

# Final stage for the application
FROM base AS final

# Copy the virtual environment from the builder stage
COPY --from=builder /app/.venv /app/.venv

# Set the PATH to include the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Copy the application code
COPY --link chat.py ./

# Set the entrypoint for the application
ENTRYPOINT ["python", "chat.py"]