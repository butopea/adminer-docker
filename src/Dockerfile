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

ARG ADMINER_VERSION=4.17.1
ARG ADMINER_FLAVOUR="-en"
ARG ADMINER_CHECKSUM="8cef8dcac2bb4598fb821859deb61c9b6889b4bdad00498a38d113954334bbb3"

RUN curl -L https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}${ADMINER_FLAVOUR}.php -o adminer.php && \
    echo "${ADMINER_CHECKSUM}  adminer.php"|sha256sum -c -

COPY index.php /var/adminer/index.php
COPY php.ini /etc/php8/conf.d/99_docker.ini

EXPOSE 8080

USER adminer
CMD [ "php84", "-S", "[::]:8080", "-t", "/var/adminer" ]

