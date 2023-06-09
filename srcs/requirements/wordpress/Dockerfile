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
    wget

RUN mkdir -p /var/www/html

RUN wget -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz \
    && tar xfz /tmp/latest.tar.gz -C /var/www/html

RUN cp -R /var/www/html/wordpress/. /var/www/html/

COPY tools/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

RUN sed -i '/listen =/d' /etc/php/7.3/fpm/pool.d/www.conf

RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php \
    && chown www-data:www-data /run/php \
    && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html/wordpress

EXPOSE 9000

CMD ["/tmp/init.sh"]
