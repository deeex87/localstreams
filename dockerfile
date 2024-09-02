FROM ubuntu:22.04

LABEL \
    com.centurylinklabs.watchtower.enable="false" \
    wud.watch="false" \
    org.opencontainers.image.authors="" \
    org.opencontainers.image.url=""

ENV ACESTREAM_VERSION="3.2.3_ubuntu_22.04_x86_64_py3.10"

WORKDIR /tmp
COPY app /app

SHELL ["/bin/bash", "-c" ]
RUN apt-get update
RUN apt-get install --no-install-recommends -y \
      python3.10 ffmpeg python3-pip python3-virtualenv python3-venv ca-certificates wget sudo\
  && rm -rf /var/lib/apt/lists/* \
  && wget --progress=dot:giga "https://download.acestream.media/linux/acestream_${ACESTREAM_VERSION}.tar.gz" \
  && mkdir acestream \
  && tar zxf "acestream_${ACESTREAM_VERSION}.tar.gz" -C acestream \
  && rm "acestream_${ACESTREAM_VERSION}.tar.gz" \
  && mv acestream /opt/acestream \
  && pushd /opt/acestream || exit \
  && bash ./install_dependencies.sh \
  && popd || exit

RUN virtualenv -p python3.10 /app/venv
RUN /app/venv/bin/pip install -r /app/requirements.txt
ENTRYPOINT /app/venv/bin/python -u /app/localstream.py

EXPOSE 15123/tcp 15123/udp

