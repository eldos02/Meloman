# Версия Alpine мы использовали для оптимизации размера образа
FROM python:3.10.7-alpine


# Это директория для нашего приложения
WORKDIR /usr/src/app

#Для улучшения кэширования мы изначально скопировали необходимые библиотеки
COPY requirements.txt .

# Здесь уже идет установка
RUN pip install --no-cache-dir -r requirements.txt

# А тут происходит копирования остальных файлов нашего проекта
COPY . .


EXPOSE 5050

CMD ["python", "app.py"]
