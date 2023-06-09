FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/algaspar.key -out /etc/ssl/algaspar.crt -subj "/C=BE/L=Brussels/O=19/CN=algaspar.42.fr"

COPY conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]