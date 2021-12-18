# Auto-generated via Ansible: edit src/ansible/Dockerfiles/base/Dockerfile.j2 instead.

FROM php:7.4-cli-alpine

# Labels
# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL "maintainer"="lotyp <lotyp7@gmail.com>"
LABEL "vendor"="wayofdev"
LABEL "org.opencontainers.image.authors"="lotyp <lotyp7@gmail.com>"
LABEL "org.opencontainers.image.url"="https://hub.docker.com/r/wayofdev/php-base"
LABEL "org.opencontainers.image.documentation"="https://github.com/wayofdev/docker-php-base"
LABEL "org.opencontainers.image.source"="https://github.com/wayofdev/docker-php-base"
LABEL "org.opencontainers.image.vendor"="wayofdev"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.ref.name"="7.4-base"
LABEL "org.opencontainers.image.title"="PHP-CLI 7.4-base"
LABEL "org.opencontainers.image.description"="PHP-CLI 7.4-base"

ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"

ENV PHP_OPCACHE_ENABLE="1"
ENV PHP_OPCACHE_ENABLE_CLI="1"
ENV PHP_TIMEZONE="UTC"
ENV PHP_POST_MAX_SIZE="16M"
ENV PHP_MEMORY_LIMIT="256M"

RUN set -eux; \
    apk -U upgrade -a \
    # Add production dependencies
    && apk add --update --no-cache \
        curl \
    # Temporary build dependencies for compiling Pecl extensions
    && apk add --update --no-cache --virtual .temp-build-deps \
        $PHPIZE_DEPS \
    # Intl - Internationalization; "icu-dev" is temporary build dependency
    && apk add --update --no-cache \
        icu-libs \
        icu-dev \
    && docker-php-ext-install -j$(nproc) intl \
    && apk del icu-dev \
    # Pcntl - Process control support
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) --ini-name docker-php-ext-00-sockets.ini sockets \
    # MySQL
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    # Postgres; "postgresql-dev" is temporary build dependency
    && apk add --no-cache -X https://dl-cdn.alpinelinux.org/alpine/edge/main postgresql-dev \
    && apk add --no-cache -X https://dl-cdn.alpinelinux.org/alpine/edge/main postgresql-libs \
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    && apk del postgresql-dev \
    # Opcache
    && docker-php-ext-install -j$(nproc) opcache \
    # Zip
    && apk add --update --no-cache \
        libzip \
        libzip-dev zlib-dev \
    && docker-php-ext-install -j$(nproc) zip \
    && apk del libzip-dev zlib-dev \
    # Bz2
    && apk add --update --no-cache \
        libbz2 \
        bzip2-dev \
    && docker-php-ext-install -j$(nproc) bz2 \
    && apk del bzip2-dev \
    # Bcmath - Arbitrary Precision Mathematics
    && docker-php-ext-install -j$(nproc) bcmath \
    ####################################################################################################################
    # Pecl Dependencies
    # Redis - In-memory data structure store driver; zstd-dev is temporary build dependency
    && apk add --update --no-cache \
        zstd-libs \
        zstd-dev \
    && pecl install redis-5.3.5RC1 \
    && docker-php-ext-enable redis \
    && apk del zstd-dev \
    # Decimal - Correctly-rounded arbitrary precision decimal floating point arithmetic
    && apk add --update --no-cache \
        mpdecimal-dev \
        mpdecimal \
    && pecl install decimal-1.4.0 \
    && docker-php-ext-enable decimal \
    && apk del mpdecimal-dev \
    && apk del -f .temp-build-deps

COPY --chown=www-data ./configs/ /usr/local/etc/php/conf.d/
