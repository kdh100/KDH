FROM centos:7

RUN yum install -y httpd php
COPY index.html info.php /var/www/html

EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -D FOREGROUND