#!/bin/bash

ACESTREAM_TGZ="acestream-armv7-master.tar.gz"

ACEADDON="/opt/acestream"
ACECHROOT="androidfs"

cd /resources
tar zxf "${ACESTREAM_TGZ}" -C acestream
mv acestream-armv7-master $ACEADDON

mkdir -p $ACEADDON/$ACECHROOT/system
mkdir -p $ACEADDON/$ACECHROOT/storage
mkdir -p $ACEADDON/$ACECHROOT/dev
mkdir -p $ACEADDON/$ACECHROOT/proc
mkdir -p $ACEADDON/$ACECHROOT/sys
mkdir -p $ACEADDON/$ACECHROOT/system/etc

cp -L /etc/resolv.conf $ACEADDON/$ACECHROOT/system/etc/resolv.conf
echo "67.215.246.10 router.bittorrent.com" >> $ACEADDON/$ACECHROOT/system/etc/hosts
echo "212.129.33.59 dht.transmissionbt.com" >> $ACEADDON/$ACECHROOT/system/etc/hosts
echo "82.221.103.244 router.utorrent.com" >> $ACEADDON/$ACECHROOT/system/etc/hosts

mount -o bind /dev $ACEADDON/$ACECHROOT/dev &>/dev/null
mount -t proc proc $ACEADDON/$ACECHROOT/proc &>/dev/null
mount -t sysfs sysfs $ACEADDON/$ACECHROOT/sys &>/dev/null

chown -R root:root $ACEADDON/$ACECHROOT/system
find $ACEADDON/$ACECHROOT/system -type d -exec chmod 755 {} \;
find $ACEADDON/$ACECHROOT/system -type f -exec chmod 644 {} \;

chmod 755 $ACEADDON/$ACECHROOT/system/bin/* $ACEADDON/$ACECHROOT/acestream.engine/python/bin/python

chroot $ACEADDON/$ACECHROOT /system/bin/busybox sh -c "/system/bin/acestream.sh" > $ACEADDON/acestream.log 2>&1