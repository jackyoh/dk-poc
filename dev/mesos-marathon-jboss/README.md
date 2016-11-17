Build image command
```
docker build --no-cache=true -t dev1/mesos-marathon-jboss:0.0.1 .
```

Start mesos master container
mesos master port:5050
marathon port:8080
jboss port:8181

```
docker run -d -p 5050:5050 -p 8888:8080 -p 8181:8181 --restart=always --name mesos-master -h mesos-master dev1/mesos-marathon-jboss:0.0.1
```

Login mesos terminal
```
docker exec -ti mesos-master /bin/bash
```

Starting jboss web service
```
curl -X POST -H "Content-type: application/json" http://172.17.0.3:8080/v2/apps -d @jboss.json
```
