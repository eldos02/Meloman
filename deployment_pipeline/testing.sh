#!/bin/bash

echo -e "\n=== Начинаем проверку нашего приложения. ==="

# Нужно запустить контейнер на фоне
echo -e "\n> Поехали! Поднимаем сервисы:"
docker-compose up -d

# Мы добавили паузу в 10 секунд чтобы контейнеры успели запуститься перед проверкой
echo -e "\n> Ждем 10 секунд чтобы контейнеры полностью запустились:"
sleep 10

#  Тестируем запросы на сервисы
echo -e "\n> Проверяем главную страницу приложения:"
if curl --silent --fail "http://localhost:5050" > /dev/null; then
    echo "✅ Главная страница доступна."
else
    echo "❌ Ошибка: Главная страница недоступна, к сожалению:("
    exit 1
fi

echo -e "\n> Проверяем GET-запрос с списком книг:"
if curl --silent --fail "http://localhost:5050/kitaps" > /dev/null; then
    echo "✅ Запрос удался!"
else
    echo "❌ Ошибка: Запрос не удался:)"
    exit 1
fi

echo -e "\n> Проверяем phpMyAdmin:"
if curl --silent --fail "http://localhost:8888" > /dev/null; then
    echo "✅ phpMyAdmin доступен!"
else
    echo "❌ phpMyAdmin увы недоступен:)"
    exit 1
fi

echo -e "\n✅ Все наши проверки  пройдены успешно!"

# После проверки останавливаем контейнеры
echo -e "\n> Останавливаем все запущенные сервисы:"
docker-compose down
