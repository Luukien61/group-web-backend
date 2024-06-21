FROM postgres:15.7-alpine

ENV POSTGRES_DB=groupweb2
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=Luudinhkien_2003

RUN mkdir -p /docker-entrypoint-initdb.d && chmod 0775 /docker-entrypoint-initdb.d

COPY backup.sql /docker-entrypoint-initdb.d/

RUN chmod 0644 /docker-entrypoint-initdb.d/backup.sql

EXPOSE 5432

#Khi container PostgreSQL khởi động lần đầu tiên và cơ sở dữ liệu không tồn tại,
# Docker entrypoint script (docker-entrypoint.sh) sẽ tự động tìm
# và thực thi tất cả các file trong thư mục /docker-entrypoint-initdb.d/.
# Điều này cho phép bạn tùy chỉnh quá trình khởi tạo cơ sở dữ liệu.