FROM centos:7.2.1511
MAINTAINER jack@is-land.com.tw
RUN yum install -y epel-release
RUN yum install -y wget tar git subversion net-tools lsof telnet openssh-server supervisor

#Install Mesos
RUN wget http://repos.mesosphere.com/el-testing/7/x86_64/RPMS/mesos-0.28.2-1.0.45.rc1.centos701406.x86_64.rpm
RUN rpm -ivh mesos-0.28.2-1.0.45.rc1.centos701406.x86_64.rpm --force --nodeps

#Install JDK
RUN wget http://192.168.1.214/sharefolder/java/jdk-7u71-linux-x64.tar.gz
RUN cd /
RUN tar zxvf jdk-7u71-linux-x64.tar.gz

#Install Marathon
RUN wget http://downloads.mesosphere.io/marathon/v0.8.0/marathon-0.8.0.tgz -P /opt
RUN cd /opt && tar zxvf /opt/marathon-0.8.0.tgz

#Install Zookeeper
RUN wget http://ftp.tc.edu.tw/pub/Apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz -P /opt
RUN cd /opt && tar zxvf /opt/zookeeper-3.4.8.tar.gz
RUN cp /opt/zookeeper-3.4.8/conf/zoo_sample.cfg  /opt/zookeeper-3.4.8/conf/zoo.cfg

#Download JBOSS
RUN wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz -P /opt
RUN cd /opt && tar zxvf /opt/jboss-as-7.1.1.Final.tar.gz
ADD ./standalone.xml /opt/jboss-as-7.1.1.Final/standalone/configuration/standalone.xml

#Download Development war
RUN wget wget http://192.168.1.118/file/war/restful-example/0.0.1/java-restful-example.war /opt/jboss-as-7.1.1.Final/standalone/deployments

#Set Env Variable
ENV JAVA_HOME /jdk1.7.0_71
ENV ZOOKEEPER_HOME /opt/zookeeper-3.4.8
RUN echo "export PATH=$JAVA_HOME/bin:$ZOOKEEPER_HOME/bin:$PATH">>/etc/profile

#RUN Service
ADD ./start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]

