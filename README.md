# Docker Mumble Server

## superpassword
Password is in the logs on the first start.

### Docker Compose
```
version: '3'
services:
    mumble:
        restart: unless-stopped
        container_name: mumble
        image: tetricz/mumble
        volumes:
         - </your/directory>:/etc/mumble/
        environment:
         - config_path="/etc/mumble/config.ini"
        ports:
         - "64738:64738/tcp"
         - "64738:64738/udp"
```
### Docker Run
```
docker run -dit -e config_path="/etc/mumble/config.ini" -v </your/directory>:/etc/mumble/ --name mumble tetricz/mumble
```
You can edit the config file for further configuration.
