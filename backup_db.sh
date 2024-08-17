#!/bin/bash

# Configuration
DB_NAME="nom_de_la_base_de_donnees"
DB_USER="nom_utilisateur"
DB_PASSWORD="mot_de_passe"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql"
LOG_FILE="/var/log/db_backup.log"
EMAIL="votre_email@exemple.com"

# Créer une sauvegarde de la base de données
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE 2>> $LOG_FILE

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Sauvegarde réussie : $BACKUP_FILE" >> $LOG_FILE
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] ERREUR : La sauvegarde a échoué pour $DB_NAME" | mail -s "Échec de la sauvegarde de la base de données" $EMAIL
    exit 1
fi

# Supprimer les sauvegardes de plus de 7 jours (optionnel)
find $BACKUP_DIR -type f -name "$DB_NAME-*.sql" -mtime +7 -exec rm {} \;

exit 0
#pour executer periodiquement 
#crontab -e
#ensuite 
#0 2 * * * /path/to/backup_db.sh
#ainsi le script sera lancé tout les jours à 2h00 du matin
