FROM debian:stretch-slim

ENV TZ=Asia/Shanghai
ENV PCRE_VERSION=8.41
ENV ZLIB_VERSION=1.2.11
ENV OPENSSL_VERSION=1.1.0g
ENV NGINX_VERSION=1.12.2
ENV BUILD_DIR=/opt/goodrain/nginx-${NGINX_VERSION}
ENV DOWNLOAD_URL=https://pkg.goodrain.com/dockerfile/ngnix

RUN mkdir -p $BUILD_DIR \
    && apt-get update \
    && apt-get install -y --no-install-recommends  build-essential curl

RUN set -x \
    && curl -sk $DOWNLOAD_URL/pcre-$PCRE_VERSION.tar.gz | tar xz -C /tmp/ \
    && curl -sk $DOWNLOAD_URL/zlib-$ZLIB_VERSION.tar.gz | tar xz -C /tmp/ \
    && curl -sk $DOWNLOAD_URL/openssl-${OPENSSL_VERSION}.tar.gz | tar xz -C /tmp/ \
    && curl -sk $DOWNLOAD_URL/nginx-${NGINX_VERSION}.tar.gz | tar xz -C /tmp/

VOLUME /opt/package

COPY build.sh /

CMD ["/build.sh"]