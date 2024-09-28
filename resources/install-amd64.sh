apt-get install --no-install-recommends -y \
ACESTREAM_TGZ="acestream_3.2.3_ubuntu_22.04_x86_64_py3.10.tar.gz"

python3-pip libpython3.10 ffmpeg python3-pip python3-virtualenv python3-venv ca-certificates wget sudo\
  && rm -rf /var/lib/apt/lists/* \
  && mkdir acestream \
  && tar zxf "${ACESTREAM_TGZ}" -C acestream \
  && rm "${ACESTREAM_TGZ}" \
  && mv acestream /opt/acestream \
  && pushd /opt/acestream || exit \
  && bash ./install_dependencies.sh \
  && popd || exit