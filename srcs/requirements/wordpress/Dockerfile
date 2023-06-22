FROM debian:buster

RUN apt-get update && apt-get install -y \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-curl \
    php7.3-gd \
    php7.3-xml \
    php7.3-mbstring \
    php7.3-zip \
    mariadb-client \
    wget \
    curl

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

RUN sed -i '/listen =/d' /etc/php/7.3/fpm/pool.d/www.conf

RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php \
    && chown www-data:www-data /run/php \
    && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html/

RUN wp core download --allow-root

EXPOSE 9000

CMD ["/tmp/init.sh"]
