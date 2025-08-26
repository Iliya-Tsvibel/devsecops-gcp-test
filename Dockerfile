FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Dependencies (file may be minimal — that’s OK)
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt || true

# App code
COPY app/ /app/

# Non-root user (good practice)
RUN useradd --create-home --uid 10001 appuser && chown -R appuser /app
USER appuser

EXPOSE 8080
CMD ["python", "app.py"]
