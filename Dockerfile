# Используем официальный образ Python 3.10
FROM python:3.10

# Устанавливаем рабочую директорию
WORKDIR /mysite

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Собираем статику
RUN python manage.py collectstatic --noinput

# Указываем команду запуска контейнера
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "mysite.wsgi:application"]
