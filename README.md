# LocalStreams

LocalStreams es una contenedor de docker diseñado para facilitar la generación de playlist m3u de canales de TV. Este proyecto permite a los usuarios acceder facilmente a una playlist customizada con los canales de televisión que emiten por internet, así como a traves de Acestream y StreamLink.

## Instalación

Para instalar LocalStreams, sigue estos pasos:

1. Asegurate de tener Docker instalado.

2. Clona el repositorio:
    ```bash
    git clone https://github.com/franlerma/localstreams.git
    ```
3. Construye la imagen:
    ```bash
    chmod +x build.sh
    ./build.sh
    ```
4. Ejecuta el contenedor:
    ```
    docker run 
        -it --name localstreams \
        --publish 15123:15123 \                                             #puertos de la aplicación
        -l com.centurylinklabs.watchtower.enable=false -l wud.watch=false   #esto es util si usas watchtower o whatsupdocker \
        --restart always \
        -v <path/a/carpeta/con/m3u>:/data/m3u \                             #ruta de la carpeta que contiene los m3u
        -v <path/a/carpeta/con/picon>:/data/picon \                         #ruta de la carpeta que contiene los picon
        franlerma/localstreams
    ```

## Uso

Las plantillas m3u admiten el formato jinja2, por lo que puedes usar las variables de la aplicación como `{{schema}}`, `{{hostname}}` o `{{port}}`, además de cualquier parametro que pases por url. 

Puedes acceder a streams de acestream y streamlink en los siguientes endpoints especiales:

    {{schema}}://{{hostname}}:{{port}}/acestream/video?id={id_acestream}
    {{schema}}://{{hostname}}:{{port}}/streamlink/video?url={url_streamlink} #Soporta cualquier url soportada por los plugins de streamlink

Por ejemplo, para la lista que se obtiene en esta url:

    http://127.0.0.1:15123/m3u/test.m3u?iptvserver=192.168.1.11:8080

puedes usar la variable `iptvserver` en la plantilla (además de las variables por defecto):

    #EXTM3U
    #EXTVLCOPT--http-reconnect=true

    #EXTINF:-1 tvg-logo="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Logo_TVE-Internacional.svg/1403px-Logo_TVE-Internacional.svg.png" tvg-name="LA 1 HD" tvg-id="LA1.es", La 1
    http://{{iptvserver}}/stream.ts

    #EXTINF:-1 tvg-logo="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Logo_TVE-Internacional.svg/1403px-Logo_TVE-Internacional.svg.png" tvg-name="LA 1 HD" tvg-id="LA1.es", La 1
    {{schema}}://{{hostname}}:{{port}}/streamlink/video?url=https://www.rtve.es/play/videos/directo/canales-lineales/la-1/

    #EXTINF:-1 tvg-logo="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Logo_TVE-Internacional.svg/1403px-Logo_TVE-Internacional.svg.png" tvg-name="LA 1 HD" tvg-id="LA1.es", La 1
    {{schema}}://{{hostname}}:{{port}}/acestream/video?id=b897de3e62d7c6bee9ef1107d972f3d1075e03ff

Se pueden pasar tantas variables en el query string como se desee.

## Licencia
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)