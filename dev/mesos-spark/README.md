Build dockerfile for docker image
```
docker build --no-cache=true -t dev2/mesos-spark:0.0.1 .
```

Run docker container
```
docker run -d -p 5151:5050 -p 7077:7077 -p 8081:8081 --restart=always --name mesos-spark -h mesos-spark dev2/mesos-spark:0.0.1
```

Execute docker terminal
```
docker exec -ti mesos-spark /bin/bash
```

Run spark pi example on client mode
```
./spark-submit --class org.apache.spark.examples.SparkPi --master mesos://172.17.0.4:5050 ../examples/jars/spark-examples_2.11-2.0.1.jar 100
```

Run spark pi example on cluster mode
```
 ./spark-submit --deploy-mode cluster --class org.apache.spark.examples.SparkPi --master mesos://192.168.1.223:7077 ../examples/jars/spark-examples_2.11-2.0.1.jar 10
```

