FROM postgres:15.7-alpine

ENV POSTGRES_DB=groupweb2
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=Luudinhkien_2003

COPY backup.sql /docker-entrypoint-initdb.d/

RUN chmod 0644 /docker-entrypoint-initdb.d/backup.sql

EXPOSE 5432