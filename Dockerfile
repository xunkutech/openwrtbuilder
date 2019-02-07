FROM alpine:latest
MAINTAINER Jason Han <han_min@hotmail.com>

RUN apk update && apk add asciidoc bash bc binutils bzip2 cdrkit coreutils diffutils findutils flex g++ gawk gcc gettext git grep intltool libxslt linux-headers make ncurses-dev patch perl python2-dev tar unzip util-linux wget zlib-dev && git clone https://github.com/shadowsocks/luci-app-shadowsocks.git && cd luci-app-shadowsocks/tools/po2lmo && make && make install && adduser --disabled-password --uid 1000 --gecos "Docker Builder,,," builder
