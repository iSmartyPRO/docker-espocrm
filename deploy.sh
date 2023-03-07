#!/bin/bash
source ../mariadb/.env
source .env

echo "Creating database: ${ESPOCRM_DATABASE_NAME}"
mysql -uroot -p${MARIADB_ROOT_PASSWORD} -h $ESPOCRM_DATABASE_IP -e "CREATE DATABASE ${ESPOCRM_DATABASE_NAME} CHARACTER SET utf8 COLLATE utf8_bin;"

echo "Creating user: ${ESPOCRM_DATABASE_USER}"
mysql -uroot -p${MARIADB_ROOT_PASSWORD} -h $ESPOCRM_DATABASE_IP -e "CREATE USER '${ESPOCRM_DATABASE_USER}'@'%' IDENTIFIED BY '${ESPOCRM_DATABASE_PASSWORD}';"

echo "Assigning permissions to user"
mysql -uroot -p${MARIADB_ROOT_PASSWORD} -h $ESPOCRM_DATABASE_IP -e "GRANT ALL PRIVILEGES ON ${ESPOCRM_DATABASE_NAME}.* TO '${ESPOCRM_DATABASE_USER}'@'%';"

echo "Flush privileges"
mysql -uroot -p${MARIADB_ROOT_PASSWORD} -h $ESPOCRM_DATABASE_IP -e "FLUSH PRIVILEGES;"
