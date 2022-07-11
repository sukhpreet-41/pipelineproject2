FROM centos:latest
MAINTAINER isukhpreetsingh12@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install zip -y
# RUN yum install unzip -y
RUN yum install httpd -y
ADD /home/sukhpreet/Desktop/site /var/www/html
WORKDIR /var/www/html
# RUN unzip photogenic.zip
RUN cp -rvf site/* .
RUN rm -rf site
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
