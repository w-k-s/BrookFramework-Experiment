FROM ubuntu as builder

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update -y
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y fpc

COPY . /var/www/app
WORKDIR /var/www/app
RUN make -B build

FROM actilis/httpd-cgi

ENV HTTPD_ENABLE_CGI=true

# COPY ./apache/httpd.conf  /etc/httpd/conf.d/000-default.conf
# COPY ./apache/htaccess /var/www/app/public/.htaccess

COPY --from=builder /var/www/app/build/cgi1 /var/www/cgi-bin