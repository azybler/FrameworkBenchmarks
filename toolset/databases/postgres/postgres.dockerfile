FROM postgres:latest

ENV POSTGRES_USER=benchmarkdbuser
ENV POSTGRES_PASSWORD=benchmarkdbpass
ENV POSTGRES_DB=hello_world

ENV POSTGRES_HOST_AUTH_METHOD=md5
ENV POSTGRES_INITDB_ARGS=--auth-host=md5
ENV PGDATA=/ssd/postgresql

COPY postgresql-min.conf /tmp/postgresql.conf

COPY create-postgres.sql /docker-entrypoint-initdb.d/
COPY config.sh /docker-entrypoint-initdb.d/

COPY 60-postgresql-shm.conf /etc/sysctl.d/60-postgresql-shm.conf
