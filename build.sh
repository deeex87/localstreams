#!/bin/bash
PROJECT_NAME="localstreams"
IMAGE_NAME="franlerma/$PROJECT_NAME"
docker build . -t $IMAGE_NAME || exit 1
#docker run -it --name $PROJECT_NAME --publish 15123:15123 -l com.centurylinklabs.watchtower.enable=false -l wud.watch=false --restart always  $IMAGE_NAME