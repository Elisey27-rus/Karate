# Используем официальный образ Python в качестве базового
FROM python:3.12-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы приложения в контейнер
COPY . /app

# Устанавливаем зависимости приложения
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Устанавливаем переменные окружения для Django
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE mysite.settings
ENV PYTHONDONTWRITEBYTECODE 1
ENV DJANGO_DEBUG=False

# Открываем порт 8000 для доступа к приложению
EXPOSE 8000

# Команда для запуска приложения
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
