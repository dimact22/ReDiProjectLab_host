# Используем базовый образ Python 3.9
FROM python:3.9

# Установка MongoDB через apt-get
RUN apt-get update && apt-get install -y \
    mongodb \
 && rm -rf /var/lib/apt/lists/*

# Установка директории приложения в контейнере
WORKDIR /app

# Копирование зависимостей приложения
COPY requirements.txt .

# Установка зависимостей Python
RUN pip install -r requirements.txt

# Копирование исходного кода приложения
COPY . .

# Определение переменной окружения для URL MongoDB
ENV MONGO_URL=mongodb://mongo:27017/redilab

# Команда для запуска вашего приложения при старте контейнера
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

