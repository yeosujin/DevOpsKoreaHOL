FROM ubuntu:lastest
MAINTAINER Wimes <junhyun.bae@cloudmt.co.kr>

# Avoiding user interaction with tzdata
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get check
RUN apt-get dist-upgrade -y
RUN apt-get install -y apache2 # install Apache web server (Only 'yes')
RUN apt-get update

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

ADD apache2.conf /etc/apache2/apache2.conf
COPY ~/_site /var/www/html
EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/apache2"]

EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]
