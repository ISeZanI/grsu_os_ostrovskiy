#!/bin/bash
BACKUP_DIR="/home/admin24/backups_24"
CURRENT_DATE=$(date +%Y%m%d_%H%M)
ARCHIVE_NAME="web_backup_24_${CURRENT_DATE}.tar.gz"

tar -czf /tmp/$ARCHIVE_NAME /var/www/html
gpg --yes --batch --recipient "Backup Key N24" --encrypt /tmp/$ARCHIVE_NAME
mv /tmp/${ARCHIVE_NAME}.gpg $BACKUP_DIR/
rm /tmp/$ARCHIVE_NAME
echo "Резервная копия ${ARCHIVE_NAME}.gpg успешно создана и зашифрована."
