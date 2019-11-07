FROM ubuntu:18.04

MAINTAINER zoo@gmail.com

RUN apt update && apt install -y git python libsodium-dev

RUN git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr

ENV SSR_PORT="443" \
    SSR_PASSWORD="zzz111" \
    SSR_METHOD="chacha20-ietf" \
    SSR_PROTOCOL="origin" \
    SSR_OBFS="http_simple"

EXPOSE $SSR_PORT

WORKDIR shadowsocksr

CMD bash bbr.sh

CMD python shadowsocks/server.py -p $SSR_PORT -k $SSR_PASSWORD -m $SSR_METHOD -O $SSR_PROTOCOL -o $SSR_OBFS
