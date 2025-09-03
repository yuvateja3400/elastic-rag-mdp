# Use slim Python base
FROM python:3.11-slim

# Set workdir
WORKDIR /app

# Install system deps (needed for PyMuPDF & others)
RUN apt-get update && apt-get install -y \
    build-essential \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project code
COPY app ./app

# Default command (will be overridden in docker-compose)
CMD ["uvicorn", "app.api:app", "--host", "0.0.0.0", "--port", "8000"]
