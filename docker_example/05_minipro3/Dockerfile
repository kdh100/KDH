FROM centos:7
RUN yum install -y httpd mod_wsgi && yum clean all
COPY vhost.conf /etc/httpd/conf.d
COPY myapp.wsgi /var/www/html/myapp.wsgi
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -D FOREGROUND