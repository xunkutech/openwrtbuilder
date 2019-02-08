FROM debian:jessie
MAINTAINER Jason Han <han_min@hotmail.com>

RUN apt-get update && \
    apt-get install -y sudo time git-core subversion build-essential g++ bash make libssl-dev patch && \
    apt-get install -y libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python xz-utils vim && \
    apt-get clean && \
    git clone https://github.com/shadowsocks/luci-app-shadowsocks.git && \
    cd luci-app-shadowsocks/tools/po2lmo && make && make install && \
    cd ../../.. && rm -rf luci-app-shadowsocks && \
    adduser --disabled-password --uid 1000 --gecos "Docker Builder,,," builder && \
    echo 'builder ALL=NOPASSWD: ALL' > /etc/sudoers.d/builder