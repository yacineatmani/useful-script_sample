#!/bin/bash

# Paramètres
SOURCE_DIR="/path/to/source/"
DEST_USER="user"
DEST_HOST="server.example.com"
DEST_DIR="/path/to/destination/"
SERVICE_NAME="apache2"

# Synchroniser les fichiers avec le serveur distant
rsync -avz --delete $SOURCE_DIR $DEST_USER@$DEST_HOST:$DEST_DIR

# Redémarrer le service web sur le serveur distant
ssh $DEST_USER@$DEST_HOST "sudo systemctl restart $SERVICE_NAME"

