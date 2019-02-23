FROM alpine:3.9
ARG bacula_version=9.4.2

# update an install software
RUN apk update --no-cache \
    && apk upgrade --no-cache \
    && apk add --no-cache \
        apache2 \
        apache2-utils \
        ca-certificates \
        make \
        openssl \
        php7 \
        php7-apache2 \
        php7-bcmath \
        php7-curl \
        php7-ctype \
        php7-dom \
        php7-json \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pgsql \
        php7-sqlite3 \
        php7-xml \
        bacula-client\
    && update-ca-certificates

RUN sed -i -e "s/^error_reporting.*=.*/error_reporting = E_ALL \& \~E_STRICT/" /etc/php7/php.ini \
    && sed -i -e "s/^memory_limit.*=.*/memory_limit = 256M/" /etc/php7/php.ini \
    && sed -i -e "s/^#.*LoadModule.*rewrite_module.*/LoadModule rewrite_module modules\/mod_rewrite.so/" /etc/apache2/httpd.conf \
    && sed -i -e "s/^#.*LoadModule.*expires_module.*/LoadModule expires_module modules\/mod_expires.so/" /etc/apache2/httpd.conf

ENV DESTDIR=/usr/share/baculum
RUN wget -O /tmp/bacula-gui-${bacula_version}.tar.gz https://downloads.sourceforge.net/project/bacula/bacula/${bacula_version}/bacula-gui-${bacula_version}.tar.gz \
    && tar -C /tmp -xzf /tmp/bacula-gui-${bacula_version}.tar.gz \
    && cd /tmp/bacula-gui-${bacula_version}/baculum \
    && make \
    && rm -r /tmp/bacula-gui-* \
    && ln -s /usr/share/baculum/etc/httpd/conf.d/baculum-web.conf /etc/apache2/conf.d/ \
    && ln -s /usr/share/baculum/etc/httpd/conf.d/baculum-api.conf /etc/apache2/conf.d/

COPY docker-entrypoint.sh /

EXPOSE 9095 9096

ENTRYPOINT /docker-entrypoint.sh
