# === Base image ===
FROM python:3.10-slim AS base

# Set working directory
WORKDIR /app

# Prevents Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose Gunicorn port
EXPOSE 8000

# Command to run Gunicorn (adjust module:project_name.wsgi if needed)
CMD ["gunicorn", "project_name.wsgi:application", "--bind", "0.0.0.0:8000", "--workers=4"]
