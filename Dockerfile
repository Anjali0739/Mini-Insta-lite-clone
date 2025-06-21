# Use an official Python image as base
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project files
COPY . .

# Expose the port your Django app runs on
EXPOSE 8000

# Run Django app (you can modify this to `gunicorn` for production)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
