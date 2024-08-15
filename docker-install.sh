#!/bin/bash

# Обновление пакетов
sudo apt-get update -qq && sudo apt-get install jq fail2ban mc htop vnstat wget git curl rsync certbot sshpass apt-transport-https ca-certificates software-properties-common net-tools speedtest-cli -qq -y;

# Добавление ключа репозитория Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Получение кодового имени текущей версии Ubuntu
codename=$(lsb_release -cs)

# Добавление репозитория Docker
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $codename stable";

# Обновление пакетов после добавления репозитория
sudo apt-get update;

# Установка Docker
sudo apt-get install docker-ce -qq -y;

# Установка Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Добавление прав на выполнение для Docker Compose
sudo chmod +x /usr/local/bin/docker-compose
