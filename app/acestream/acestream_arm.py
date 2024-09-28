import os

ACEADDON="/opt/acestream"
ACECHROOT="androidfs"


def launch_acestream_arm(acestream_args, acestream_port, acestream_cache_dir):
    ACESTREAM_BINARY = os.getenv("ACESTREAM_BINARY", "/opt/acestream/acestreamengine-arm64") + "/acestreamengine"
    #chroot $ACEADDON/$ACECHROOT /system/bin/busybox sh -c "/system/bin/acestream.sh" > $ACEADDON/acestream.log 2>&1
    command = ['chroot', f"{ACEADDON}/{ACECHROOT}", '/system/bin/busybox', 'sh', '-c', f"/system/bin/acestream.sh > {ACEADDON}/acestream.log 2>&1"]

    return command