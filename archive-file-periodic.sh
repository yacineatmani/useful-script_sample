#!/bin/bash

# Paramètres
SOURCE_DIR="/path/to/source/"
BACKUP_DIR="/path/to/backup/"
DATE=$(date +%Y%m%d%H%M%S)
ARCHIVE_NAME="backup_$DATE.tar.gz"

# Créer l'archive
tar -czf $BACKUP_DIR/$ARCHIVE_NAME $SOURCE_DIR

echo "Sauvegarde terminée : $ARCHIVE_NAME"

