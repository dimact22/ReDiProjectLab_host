FROM python:3.8-slim

RUN apt-get update && apt-get install -y \
    mongodb \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV MONGO_URL=mongodb://mongo:27017/redilab

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

