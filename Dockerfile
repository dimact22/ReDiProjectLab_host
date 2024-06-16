# Использование официального образа Python 3.9 в качестве базового образа
FROM python:3.9

# Установка директории приложения в контейнере
WORKDIR /app

# Копирование зависимостей Python
COPY requirements.txt .

# Установка зависимостей Python
RUN pip install -r requirements.txt

# Копирование всего остального в контейнер
COPY . .

# Установка переменной окружения для URL MongoDB
ENV MONGO_URL=mongodb://0.0.0.0:27017/redilab

# Команда для запуска вашего приложения
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
