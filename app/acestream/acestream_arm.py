import os

def launch_acestream_arm(acestream_args, acestream_port, acestream_cache_dir):
    ACESTREAM_BINARY = os.getenv("ACESTREAM_BINARY", "/opt/acestream/acestreamengine-arm64") + "/acestreamengine"
    #chroot $ACEADDON/$ACECHROOT /system/bin/busybox sh -c "/system/bin/acestream.sh" > $ACEADDON/acestream.log 2>&1
    command = [ ACESTREAM_BINARY, "--client-console", "--http-port", f"{acestream_port}", 
                    "--cache-dir", f"{acestream_cache_dir}", #"--cache-limit", f"{ACESTREAM_CACHE_LIMIT}", 
                    "", "--bind-all", acestream_args]
    return command