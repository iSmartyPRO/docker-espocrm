#!/bin/bash
source .env

# Create TEMP Folder for backups
foldername=$(date +%Y-%m-%d_%H%M%S)
mkdir -p $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm
echo "Created backup folder $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm"

# Copy all files to TEMP Folder
echo "Copying all files to TEMP Folder"
cp -rf ./espocrm $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm

# Dump database to sql file
echo "Dumping Database"
mysqldump -u${ESPOCRM_DATABASE_USER} -p${ESPOCRM_DATABASE_PASSWORD} -h $ESPOCRM_DATABASE_IP $ESPOCRM_DATABASE_NAME > $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/$ESPOCRM_DATABASE_NAME.sql

# Archive Files
echo "Archiving..."
tar -czf $BACKUP_FOLDER/$foldername.tar.gz -C $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} .

echo "Deleting TEMP Folder"
rm -rf $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} 

echo "Done!!!"
