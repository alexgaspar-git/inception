FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tools/create_db.sql /tmp/create_db.sql

RUN chmod +r /tmp/create_db.sql

RUN chown -R mysql:mysql /var/lib/mysql

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

EXPOSE 3306

USER mysql

CMD ["mysqld", "--init-file", "/tmp/create_db.sql"]


