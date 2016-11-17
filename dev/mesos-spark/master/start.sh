#!/bin/bash
source /etc/profile
ip=`awk /mesos-spark/,/^$/ /etc/hosts|awk '{print $1}'`
nohup mesos-master --ip=$ip --work_dir=/var/lib/mesos &
nohup mesos-slave --master=$ip:5050 --resources='cpus(*):4;mem(*):8192' --work_dir=/var/lib/mesos --launcher=posix --no-systemd_enable_support &
/opt/spark-2.0.1-bin-hadoop2.7/sbin/start-mesos-dispatcher.sh --master mesos://$ip:5050
supervisord -n
