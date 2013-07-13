#!/bin/bash
_PATH="/mnt/tank/scripts"
_BACKUP_BASEDIR="/mnt/backup"
_BACKUP_DESTDIR="/mnt/externalBackup"
_BACKUP_DATASETS=( vms/opennebula )
_BACKUP_RSYNC_CMD="idprio 31 rsync -aq --bwlimit=20000"

export $_BACKUP_BASEDIR $_BACKUP_DESTDIR $_BACKUP_DATASETS $_BACKUP_RSYNC_CMD

$_PATH/01-mount-snaps.sh
$_PATH/02-rsync.sh
$_PATH/03-umount-snaps.sh
