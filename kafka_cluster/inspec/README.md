# OSM Kafka Test Cases

```
Profile: Test cases for OSM Kafka Cluster (kafka-osm-test-cases)
Version: 0.1.0
Target:  local://

  ✔  zookeeper-01: Zookeeper file permissions
     ✔  File /opt/zookeeper is expected to exist
     ✔  File /opt/zookeeper owner is expected to eq "kafka"
     ✔  File /opt/zookeeper group is expected to eq "kafka"
     ✔  File /opt/zookeeper mode is expected to cmp == "0755"
     ✔  File /etc/systemd/system/zookeeper.service is expected to exist
     ✔  File /etc/systemd/system/zookeeper.service owner is expected to eq "root"
     ✔  File /etc/systemd/system/zookeeper.service group is expected to eq "root"
     ✔  File /etc/systemd/system/zookeeper.service mode is expected to cmp == "0644"
     ✔  File /opt/zookeeper/myid is expected to exist
     ✔  File /opt/zookeeper/myid owner is expected to eq "kafka"
     ✔  File /opt/zookeeper/myid group is expected to eq "kafka"
     ✔  File /opt/zookeeper/myid mode is expected to cmp == "0644"
     ✔  File /opt/kafka/config/zookeeper.properties is expected to exist
     ✔  File /opt/kafka/config/zookeeper.properties owner is expected to eq "kafka"
     ✔  File /opt/kafka/config/zookeeper.properties group is expected to eq "kafka"
     ✔  File /opt/kafka/config/zookeeper.properties mode is expected to cmp == "0644"
  ✔  zookeeper-02: Zookeeper service status
     ✔  Service zookeeper is expected to be installed
     ✔  Service zookeeper is expected to be enabled
     ✔  Service zookeeper is expected to be running
  ✔  zookeeper-03: Zookeeper port status
     ✔  Port 2181 protocols is expected to include "tcp"
     ✔  Port 2181 addresses is expected to include "0.0.0.0"
  ✔  kafka-01: Java package check
     ✔  Command: `java -version` exit_status is expected to eq 0
  ✔  kafka-02: Kafka user and file permissions
     ✔  User kafka is expected to exist
     ✔  User kafka shell is expected to eq "/sbin/nologin"
     ✔  File /var/log/kafka is expected to exist
     ✔  File /var/log/kafka owner is expected to eq "kafka"
     ✔  File /var/log/kafka group is expected to eq "kafka"
     ✔  File /var/log/kafka mode is expected to cmp == "0755"
     ✔  File /etc/systemd/system/kafka-server.service is expected to exist
     ✔  File /etc/systemd/system/kafka-server.service owner is expected to eq "root"
     ✔  File /etc/systemd/system/kafka-server.service group is expected to eq "root"
     ✔  File /etc/systemd/system/kafka-server.service mode is expected to cmp == "0644"
     ✔  File /opt/kafka/config/server.properties is expected to exist
     ✔  File /opt/kafka/config/server.properties owner is expected to eq "kafka"
     ✔  File /opt/kafka/config/server.properties group is expected to eq "kafka"
     ✔  File /opt/kafka/config/server.properties mode is expected to cmp == "0644"
  ✔  kafka-03: Kafka service status
     ✔  Service kafka-server is expected to be installed
     ✔  Service kafka-server is expected to be enabled
     ✔  Service kafka-server is expected to be running
  ✔  kafka-04: Kafka port status
     ✔  Port 9092 protocols is expected to include "tcp"
     ✔  Port 9092 addresses is expected to include "0.0.0.0"
```
