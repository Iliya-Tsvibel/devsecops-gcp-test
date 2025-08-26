FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app

# зависимости (если файл пустой - команда пройдёт)
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt || true

# код приложения
COPY app/ /app/

# безопасный пользователь
RUN useradd --create-home --uid 10001 appuser && chown -R appuser /app
USER appuser

EXPOSE 8080
# твой server.py уже слушает PORT и отдаёт 'ok' на / и /healthz
CMD ["python","server.py"]
