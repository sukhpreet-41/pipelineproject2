FROM centos:latest
MAINTAINER isukhpreetsingh12@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# RUN yum install zip -y
# RUN yum install unzip -y
RUN yum install httpd -y
RUN yum install git -y
RUN git clone https://github.com/sukhpreet-41/site2.git
RUN cp /site2/index.html /var/www/html
# ADD /home/sukhpreet/Desktop/site /var/www/html
# WORKDIR /var/www/html

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
