#!/bin/bash

for i in "${_BACKUP_DATASETS[@]}"
do
   MOUNT_DIR=$_BACKUP_BASEDIR/$i
   if [ -d $MOUNT_DIR ]; then
       umount $MOUNT_DIR && echo umounted $MOUNT_DIR
       rmdir $MOUNT_DIR && echo rmdir $MOUNT_DIR
   fi
done

