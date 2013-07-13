#!/bin/bash

for i in "${_BACKUP_DATASETS[@]}"
do
   MOUNT_DIR=$_BACKUP_BASEDIR/$i
   if [ -d $MOUNT_DIR ]; then
       echo Already mounted?
       exit -1
   fi
   mkdir -p $MOUNT_DIR
   SNAP=`zfs list -t snapshot | grep $i | tail -n1|awk -F' ' '{print $1}'`
   if [ -n "$SNAP" ]; then
       mount -t zfs $SNAP $MOUNT_DIR && echo Mounted $SNAP on $MOUNT_DIR
   fi
done
