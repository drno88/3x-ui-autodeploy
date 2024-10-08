#!/bin/bash

echo -e "\e[1;32mПроверка фонового процесса установки dpkg\e[0m"
# Проверка, что установка пакетов не выполняется
while sudo lsof /var/lib/dpkg/lock-frontend; do
    echo "\e[1;31mНайден фоновый процесс установки, Пожалуйста, ждите...\e[0m"
    sleep 5
done
echo -e "\e[1;32mФонового процесса dpkg не найдено. Начинаю установку...\e[0m"

# Получаем внешний IP-адрес
external_ip=$(curl -s https://ipinfo.io/ip)

# Обновление пакетов
sudo apt-get update -qq && sudo apt-get reinstall jq fail2ban mc htop vnstat wget git curl apt-transport-https ca-certificates software-properties-common net-tools -qq -y;

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

sleep 5

#установка вебПанели 3x-ui в докер

#создаем папку
mkdir /opt/xray;
cd /opt/xray;

#загружаем конфигурацию в папку
wget -O /opt/xray/docker-compose.yml https://raw.githubusercontent.com/drno88/3x-ui-autodeploy/main/3x-ui.yml;

#запускаем панель
docker-compose -f /opt/xray/docker-compose.yml up -d;

sleep 2

#проверяем что все запустилось
docker ps

echo -e "\e[1;32mУстановка завершена\e[0m"
echo -e "\e[1;32mПанель доступна по адресу http://$external_ip:2053\e[0m"
echo -e "\e[1;32mЛогин и пароль от панели admin admin\e[0m"

