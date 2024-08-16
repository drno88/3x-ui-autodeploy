Этот проект предназначен для простой установки
3x-ui  в докер.
Тестировалось на ЧИСТОМ ubuntu server 22.04
Скприпт устанавливает необходимые зависимости, Docker Compose и запускает 3x-ui WebPanel
Файлы располагаются в папке /opt/xray

Чтобы установить и запустить проект необходимо
подключиться к серверу по ssh
скопировать команду ниже в консоль сервера и нажать Enter. Дождаться окончания установки

curl -o autoinstall-3x-ui.sh https://raw.githubusercontent.com/drno88/xray-docker/main/autoinstall-3x-ui.sh && bash autoinstall-3x-ui.sh
