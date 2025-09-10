# Dockerfile for Django + Gunicorn
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Copy only the Django app
COPY app/ .

# Expose Gunicorn port
EXPOSE 8000

# Run Gunicorn with the correct project name
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000", "--workers=4"]
