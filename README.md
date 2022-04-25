# Краткое описание
Условно бесплатная CRM систсема.
Выполняет базовый функционал, который более чем достаточен для небольшой компании.
Для расширения возможностей необходимо докупать плагины.


# Как пользоваться

переиименуйте

## Установка
```
git clone https://github.com/iSmartyPRO/docker-espocrm.git espocrm
cd espocrm
cp .env.sample .env
vim .env
```

## Удаление
```
docker-compose down
```

# Дополнения

## Установка crontab
Для того чтобы выполнялись автоматически задачи EspoCRM - рекомендуется дополнительно настроить контейнер.

```
docker exec -ti espocrm bash
```

Установка зависимостей
```
apt update
apt install cron
apt install vim
```
Настройка crontab
```
crontab -e
```
Прописываем следующее:
```
* * * * * php -f /var/www/html/cron.php > /dev/null 2>&1
```
