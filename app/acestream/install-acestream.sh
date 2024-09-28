#!/bin/bash
ARCH=$(uname -m)
echo $ARCH
if [ "$ARCH" = "x86_64" ]; then
  bash ./install-amd64.sh
elif [ "$ARCH" = "arm64" ]; then
  bash ./install-arm.sh
else
  echo "Unsupported architecture: $ARCH"
  exit 1    
fi
