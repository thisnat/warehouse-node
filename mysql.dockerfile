FROM mysql

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

ADD warehouse.sql /docker-entrypoint-initdb.d