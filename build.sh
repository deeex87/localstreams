#!/bin/bash
docker build . -t deeex87/localstream || exit 1
#docker run -it --name localstream --publish 15123:15123 -l com.centurylinklabs.watchtower.enable=false -l wud.watch=false --restart always  deeex87/localstream