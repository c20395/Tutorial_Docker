FROM rhel7:7.5
LABEL description="RedHat Container"
MAINTAINER Jose B. Alos <jose.alos@airbus.com>
RUN yum install -y httpd && yum update
EXPOSE 80
ENV LogLevel "info"
USER apache
ADD http://www.rediris.es/index.html /var/www/html/
COPY ./src/ /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D","FOREGROUND"]
