#!/bin/bash

# Paramètres
THRESHOLD=80
EMAIL="admin@example.com"

# Vérifier l'utilisation du disque
usage=$(df -h | grep '/dev/sda1' | awk '{print $5}' | sed 's/%//g')

if [ $usage -gt $THRESHOLD ]; then
  echo "Utilisation du disque critique: $usage%" | mail -s "Alerte d'utilisation du disque" $EMAIL
fi

