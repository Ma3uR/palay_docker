FROM nginx:1.24

RUN echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list

## Update
RUN apt-get update
RUN apt-get update --fix-missing

RUN touch /var/log/nginx/access.log && chmod 777 /var/log/nginx/access.log \
    && touch /var/log/nginx/error.log && chmod 777 /var/log/nginx/error.log
