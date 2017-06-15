FROM phpmyadmin/phpmyadmin

MAINTAINER Jeremy Crombez <jeremy.crombez [at] kibatic.com>

ADD etc/phpmyadmin/config.user.inc.php /etc/phpmyadmin/config.user.inc.php

ADD https://github.com/kibatic/phpmyadmin-docker-discovery/archive/69177be290e7c8f41a0674b9e978d079005e959e.zip /
RUN unzip /69177be290e7c8f41a0674b9e978d079005e959e.zip
RUN mkdir /etc/phpmyadmin/discovery
RUN mv /phpmyadmin-docker-discovery-*/* /etc/phpmyadmin/discovery

RUN apk add --update --no-cache \
    wget \
    curl \
    git \
    php5 \
    php5-curl \
    php5-openssl \
    php5-json \
    php5-phar \
    php5-dom \
    php5-mcrypt \
    php5-pdo_mysql \
    php5-ctype \
    php5-xml \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN cd /etc/phpmyadmin/discovery && composer install

RUN sed -i 's/nobody/root/g' /etc/php-fpm.conf
RUN sed -i 's/nobody/root/g' /etc/nginx.conf
RUN sed -i 's/nobody/root/g' /etc/supervisor.d/php.ini
RUN sed -i 's/--nodaemonize/--nodaemonize --allow-to-run-as-root/g' /etc/supervisor.d/php.ini
