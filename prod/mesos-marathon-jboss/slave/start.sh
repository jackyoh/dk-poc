#!/bin/bash
nohup mesos-slave --master=$ip:5050 --resources='cpus(*):4;mem(*):8192' --work_dir=/var/lib/mesos --launcher=posix --no-systemd_enable_support &
