import os
import subprocess
from localstream import logger

def launch_acestream_amd64(acestream_args, acestream_port, acestream_cache_dir):
    ACESTREAM_BINARY = os.getenv("ACESTREAM_BINARY", "/opt/acestream/acestreamengine")
    command = [ ACESTREAM_BINARY, "--client-console", "--http-port", f"{acestream_port}", 
                    "--cache-dir", f"{acestream_cache_dir}", #"--cache-limit", f"{ACESTREAM_CACHE_LIMIT}", 
                    "", "--bind-all", acestream_args]
    
    logger.info(f"Executing Acestream process: {command}")
    acestream_process = subprocess.Popen(command, 
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    return acestream_process