#!/bin/bash
source /etc/profile
ip=`awk /mesos-master/,/^$/ /etc/hosts|awk '{print $1}'`
nohup mesos-master --ip=$ip --work_dir=/var/lib/mesos &
nohup mesos-slave --master=$ip:5050 --work_dir=/var/lib/mesos --launcher=posix --no-systemd_enable_support &
/opt/zookeeper-3.4.8/bin/zkServer.sh start
/opt/marathon-0.8.0/bin/start --master $ip:5050
supervisord -n
