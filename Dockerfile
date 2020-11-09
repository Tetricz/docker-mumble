FROM alpine:3.12
LABEL maintainer="github.com/Tetricz"

ARG mumble_version="1.3.3"
ARG URL="https://github.com/mumble-voip/mumble/releases/download/${mumble_version}/murmur-static_x86-${mumble_version}.tar.bz2"

ENV config_path="/etc/mumble/config.ini"

RUN adduser -DHs /sbin/nologin mumble

COPY ./config.ini /opt/mumble/config.ini
COPY ./entrypoint.sh /

RUN apk --no-cache add ca-certificates bzip2 su-exec tar tzdata wget && \
    mkdir -p /opt/mumble/ /etc/mumble/ && \
    wget -O /tmp/mumble-static_x86-${mumble_version}.tar.bz2 ${URL} && \
    bzip2 -d /tmp/mumble-static_x86-${mumble_version}.tar.bz2 && \
    tar -xvf /tmp/mumble-static_x86-${mumble_version}.tar --strip-components=1 -C /opt/mumble/ && \
    chmod +x /opt/mumble/murmur.x86 /entrypoint.sh && \
    chown -R mumble:mumble /etc/mumble/ /opt/mumble/

EXPOSE 64738 64738/udp

ENTRYPOINT [ "./entrypoint.sh" ]