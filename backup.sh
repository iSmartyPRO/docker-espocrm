#!/bin/bash
source .env

# Create TEMP Folder for backups
foldername=$(date +%Y-%m-%d_%H%M%S)
mkdir -p $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm
echo "Created backup folder $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm"

# Copy all files to TEMP Folder
echo "Copying all files to TEMP Folder"
cp -rf ./espocrm $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm
cp -rf ./.env $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./backup.sh $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./deploy.sh $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./docker-compose.yml $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./README.md $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/

# Dump database to sql file
echo "Dumping Database"
mysqldump -u${BACKUP_DATABASE_USER} -p${BACKUP_DATABASE_PASS} -h $BACKUP_DATABASE_IP $BACKUP_DATABASE_NAME > $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/$BACKUP_DATABASE_NAME.sql

# Archive Files
echo "Archiving..."
tar -czf $BACKUP_FOLDER/$foldername.tar.gz -C $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} .

echo "Deleting TEMP Folder"
rm -rf $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} 

echo "Done!!!"
