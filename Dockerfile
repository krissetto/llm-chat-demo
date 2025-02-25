# syntax=docker/dockerfile:1

# Use a slim Python base image
FROM python:3.9-slim AS base

# Set working directory
WORKDIR /app

# Builder stage for installing dependencies
FROM base AS builder

# Copy requirements file
COPY --link requirements.txt ./

# Install dependencies in a virtual environment
RUN --mount=type=cache,target=/root/.cache/pip \
    python -m venv .venv && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

# Final stage for the application
FROM base AS final

# Copy the virtual environment from the builder stage
COPY --from=builder /app/.venv /app/.venv

# Copy application code
COPY --link chat.py ./

# Set the PATH to include the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Create a non-root user
RUN useradd -m appuser
USER appuser

# Command to run the application
CMD ["python", "chat.py"]