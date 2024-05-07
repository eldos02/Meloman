#!/bin/bash

echo "Начинаем проверки запущенного приложения:"

# Проверяем наличие запущенных контейнеров
containers=$(docker ps --quiet --format '{{.ID}}')

if [ -z "$containers" ]; then
    echo "Запущенных контейнеров в системе нет."
    exit 1
fi

echo "Наши запущенные контейнеры:"

# Получаем и выводим статус каждого контейнера
for container in $containers
do
    # Получаем имя контейнера
    name=$(docker inspect --format '{{ .Name }}' "$container" | sed 's/^\///')
    echo "$name"

    # Получаем статус контейнера
    status=$(docker inspect --format '{{ .State.Status }}' "$container")
    echo "Статус: $status"

    # Выводим статистику по использованию ресурсов контейнером
    docker stats "$container" --no-stream --format "CPU: {{.CPUPerc}} Вес контейнера: {{.MemPerc}}"
done

echo "Отлично! Проверка закончена."
