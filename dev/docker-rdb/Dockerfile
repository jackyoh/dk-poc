FROM centos:6.6
MAINTAINER jack<jack@is-land.com.tw>
RUN yum install -y epel-release
RUN yum install -y mysql-server supervisor

RUN service mysqld start; \
    mysql -uroot -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'admin'"; \
    mysql -uroot -padmin -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'admin'"; \
    mysql -uroot -padmin -e "CREATE DATABASE dbtest"

RUN ls -l
ADD ./start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
