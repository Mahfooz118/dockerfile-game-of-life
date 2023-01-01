
FROM centos:8
MAINTAINER MAHFOOZ
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN mkdir /mnt/servers/
WORKDIR /mnt/servers/
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.zip
CMD unzip apache-tomcat-9.0.70.zip
CMD chmod 777 apache-tomcat-9.0.70
RUN yum install java-1.8.0-openjdk-devel.x86_64 -y && yum install git -y
WORKDIR /tmp
ADD gameoflife.war /tmp
EXPOSE 8080
CMD ["/mnt/servers/apache-tomcat-9.0.70/bin", "./startup.sh"]
