FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server \
    gettext \
    moreutils \
    && rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/create_db.sql /tools/create_db.sql
COPY tools/entrypoint.sh /tools/entrypoint.sh

RUN chmod 777 /tools/create_db.sql
RUN chmod 777 /tools/entrypoint.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

EXPOSE 3306

USER mysql

ENTRYPOINT ["/tools/entrypoint.sh"] 

CMD ["mysqld", "--init-file", "/tools/create_db.sql"]


