import os
import subprocess

ACEADDON="/opt/acestream"
ACECHROOT="androidfs"


def launch_acestream_arm(acestream_args, acestream_port, acestream_cache_dir):
    #chroot $ACEADDON/$ACECHROOT /system/bin/busybox sh -c "/system/bin/acestream.sh" > $ACEADDON/acestream.log 2>&1
    #command = ['chroot', f"{ACEADDON}/{ACECHROOT}", '/system/bin/busybox', 'sh', '-c', f"/system/bin/acestream.sh > {ACEADDON}/acestream.log 2>&1"]
    command = ['/system/bin/busybox', 'sh', '-c', f"/system/bin/acestream.sh > {ACEADDON}/acestream.log 2>&1"]

    acestream_process = subprocess.Popen(command, 
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    return acestream_process, command