FROM phpmyadmin/phpmyadmin

MAINTAINER Jeremy Crombez <jeremy.crombez [at] kibatic.com>

ADD etc/phpmyadmin/config.user.inc.php /etc/phpmyadmin/config.user.inc.php

ADD https://github.com/kibatic/phpmyadmin-docker-discovery/archive/6e12da059eb127d0791ce984ee3f8a2153045082.zip /
RUN unzip /6e12da059eb127d0791ce984ee3f8a2153045082.zip
RUN mkdir /etc/phpmyadmin/discovery
RUN mv /phpmyadmin-docker-discovery-*/* /etc/phpmyadmin/discovery

RUN sed -i 's/nobody/root/g' /etc/php-fpm.conf
RUN sed -i 's/nobody/root/g' /etc/nginx.conf
RUN sed -i 's/nobody/root/g' /etc/supervisor.d/php.ini
RUN sed -i 's/--nodaemonize/--nodaemonize --allow-to-run-as-root/g' /etc/supervisor.d/php.ini
