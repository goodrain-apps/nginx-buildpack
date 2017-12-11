#!/bin/bash

[[ $DEBUG ]] && set -x

cd /tmp/nginx-$NGINX_VERSION \
&& ./configure \
	--prefix=$BUILD_DIR \
    --with-http_ssl_module \
    --with-pcre=/tmp/pcre-$PCRE_VERSION \
    --with-zlib=/tmp/zlib-$ZLIB_VERSION \
    --with-openssl=/tmp/openssl-${OPENSSL_VERSION} \
&& make \
&& make install \
&& tar czvf /opt/package/nginx-${NGINX_VERSION}.tar.gz $BUILD_DIR \
&& echo "Nginx $NGINX_VERSION build completed successfully."