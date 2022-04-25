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

в дополнении рекомендую использовать единую сеть для всех контейнеров, для этого отредактировав docker-compose.yml добавив следующие строки:
```
networks:
  default:
    external:
      name: "docker-net"
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
apt install nano
```
Настройка crontab
```
nano /etc/crontab
```
Дописываем следующее:
```
* * * * * php -f /var/www/html/cron.php > /dev/null 2>&1
```

Проверяем службу cron при необходимости запускаем
```
service cron status
service cron start
```
