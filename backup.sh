#!/bin/bash
source .env
logName=$(date +%Y-%m-%d_%H%M%S).log
echo "$(date +%H:%M:%S) -> Started backup process!" >> ./backups/${logName}
# Create TEMP Folder for backups
foldername=$(date +%Y-%m-%d_%H%M%S)
mkdir -p $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm
echo "$(date +%H:%M:%S) -> Created backup folder $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm" >> ./backups/${logName}

# Copy all files to TEMP Folder
echo "$(date +%H:%M:%S) -> Copying all files to TEMP Folder -> $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}" >> ./backups/${logName}
cp -rf ./espocrm $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/espocrm
cp -rf ./.env $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./backup.sh $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./deploy.sh $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./docker-compose.yml $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/
cp -rf ./README.md $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/

# Dump database to sql file
echo "$(date +%H:%M:%S) -> Dumping Database to folder -> $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/$BACKUP_DATABASE_NAME.sql" >> ./backups/${logName}
mysqldump -u${BACKUP_DATABASE_USER} -p${BACKUP_DATABASE_PASS} -h $BACKUP_DATABASE_IP $BACKUP_DATABASE_NAME > $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}/$BACKUP_DATABASE_NAME.sql

# Archive Files
echo "$(date +%H:%M:%S) -> Archiving folder $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} to file $BACKUP_FOLDER/$foldername.tar.gz" >> ./backups/${logName}
tar -czf $BACKUP_FOLDER/$foldername.tar.gz -C $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} .

archiveSize=$(($(stat -c %s $BACKUP_FOLDER/$foldername.tar.gz ) / 1024 / 1024))
echo "$(date +%H:%M:%S) -> Arhive completed. Archive size is: ${archiveSize}Mb" >> ./backups/${logName}

echo "$(date +%H:%M:%S) -> Deleting TEMP Folder -> $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername}" >> ./backups/${logName}
rm -rf $BACKUP_TMP/${DOCKER_CONTAINER_NAME}_${foldername} 

echo "$(date +%H:%M:%S) -> Done!!!" >> ./backups/${logName}
