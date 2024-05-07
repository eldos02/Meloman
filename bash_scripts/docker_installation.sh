#!/bin/bash
echo "Проверяем , есть ли Docker и Docker-compose:"

# Тут мы проверям наличие Докера
if which docker >/dev/null; then
    echo "У вас есть уже Докер"
else
    echo "Докер отсутсвует. Начинается установка: "
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
fi

# А тут проверка Docker-compose
if which docker-compose >/dev/null; then
    echo "Docker-compose уже есть"
else
    echo "Docker-compose отсутсвует. Начинается установка:"
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi
