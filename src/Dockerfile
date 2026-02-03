FROM alpine:3.21

RUN	addgroup -S adminer && \
    adduser -S -G adminer adminer && \
    mkdir -p /var/adminer && \
    chown -R adminer:adminer /var/adminer

RUN apk add --no-cache \
    curl \
    php84 \
    php84-opcache \
    php84-pdo \
    php84-pdo_mysql \
    php84-pdo_odbc \
    php84-pdo_pgsql \
    php84-pdo_sqlite \
    php84-session

#RUN ln -sf /usr/bin/php84 /usr/bin/php

WORKDIR /var/adminer

ARG ADMINER_VERSION=5.4.1
ARG ADMINER_FLAVOUR="-en"
ARG ADMINER_CHECKSUM="85d70270c469a4a7ff6f636d86bc714e1dfc603935e73c455aab7cafa6a4f0cb"

RUN curl -L https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}${ADMINER_FLAVOUR}.php -o adminer.php && \
    echo "${ADMINER_CHECKSUM}  adminer.php"|sha256sum -c -

COPY index.php /var/adminer/index.php
COPY php.ini /etc/php84/conf.d/99_docker.ini

EXPOSE 8080

USER adminer
CMD [ "php84", "-S", "[::]:8080", "-t", "/var/adminer" ]

