FROM docker.m.daocloud.io/bitnami/mysql:8.4.5

MAINTAINER "isuuuu"

ENV TZ=Asia/Shanghai
ENV MYSQL_ROOT_HOST="%"
ENV MYSQL_ROOT_USER=root
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_CHARACTER_SET=utf8mb4
ENV MYSQL_COLLATE=utf8mb4_general_ci

COPY initdb/initdb.sql /docker-entrypoint-initdb.d
COPY initdb/nacos.sql /docker-entrypoint-initdb.d

EXPOSE 3306
