
FROM php:7.1-fpm-alpine3.10

LABEL Maintainer Natakorn Chanasumon <natakorn@wewillapp.com>

# Add Repositories
RUN rm -f /etc/apk/repositories &&\ 
  echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/main" >> /etc/apk/repositories && \
  echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories

# Add Build Dependencies
RUN apk update && apk add --no-cache --virtual .build-deps  \
  zlib-dev \
  libxml2-dev \
  bzip2-dev

# Add Production Dependencies
RUN apk add --update --no-cache \
  supervisor \
  nano \
  icu-dev \
  freetype-dev \
  libzip-dev \
  mysql-client
# Configure & Install Extension
RUN docker-php-ext-install \ 
  json \
  xml \
  zip \
  bz2 \
  pcntl \
  mysqli \ 
  pdo \ 
  pdo_mysql \ 
  bcmath

# Add Composer
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="./vendor/bin:$PATH"

RUN apk del -f .build-deps 

WORKDIR /app
