FROM python:3.11-slim

# Never buffer logs; no .pyc
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1

WORKDIR /app

# Install deps (fail fast — без "|| true")
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# App code
COPY app/ /app/

# Run as non-root
RUN useradd --create-home --uid 10001 appuser && chown -R appuser /app
USER appuser

# Cloud Run will set $PORT; bind to it
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:${PORT}", "app:app"]
