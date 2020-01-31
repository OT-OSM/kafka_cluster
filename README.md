# Ansible Role: Kafka Cluster

An ansible role which will setup kafka and zookeeper cluster for your environment

## Requirements

The only requirement for this role is java.

You can find our java role [here](https://github.com/OT-OSM/java)

## Role Variables

### Mandatory Variables
#### Needs to be change depending upon environment

|**Variables**| **Default Values**| **Description**|
|----------|---------|---------------|
|zookeeper_data_dir| /opt/zookeeper | Data directory where zookeeper will store its information |
|installation_dir | /opt | Directory where you want to install kafka |
|kafka_major_version | 2.12 | Major version of kafka release |
|kafka_minor_verion | 2.2.1 | Minor version of kafka release |

### Optional Variables

|**Variables**| **Default Values**| **Description**|
|--------------|-------------|-------------------|
|kafka_service_user_name| kafka | Kafka system user name from which all things will run |
|kafka_service_group_name| kafka | Kafka system group name from which all things will run |
|kafka_logs_dir| /var/log/kafka | Directory where kafak will generate logs |
|zk_client_port| 2181 | Zookeeper client port for connection |
|init_limit| 5 | initLimit is timeouts ZooKeeper uses to limit the length of time the ZooKeeper servers in quorum have to connect to a leader|
|sync_limit | 2 | The entry syncLimit limits how far out of date a server can be from a leader|
|tick_time | 2000 | The basic time unit in milliseconds used by ZooKeeper. It is used to do heartbeats and the minimum session timeout will be twice the tickTime |
|max_memory_heap | -Xmx256M | This is the maximum heap size of kafka which should be change according to the server configuration |
|min_memory_heap | -Xmx128M | This is the minimum heap size of kafka which should be change according to the server configuration |

## Inventory

An inventory should look like this:-

```ini
[zookeeper]                  # Host and Id information for zookeeper
zookeeper1    zookeeper_id=1
zookeeper2    zookeeper_id=2
zookeeper3    zookeeper_id=3

[kafka]                      # Host and broker id information for kafka
kafka1   kafka_broker_id=1
kafka2   kafka_broker_id=2
kafka3   kafka_broker_id=3

[kafka_cluster:children]     # Parend group for kafka and zookeeper group
zookeeper
kafka

[kafka_cluster:vars]         # Variabled for kafka_cluster parent group
ansible_user=ubuntu
```

## Example Playbook

Here is an example playbook:-

```yml
---
- hosts: kafka_cluster
  roles:
    - role: osm_kafka_cluster
      become: yes
```

## Usage

For using this role you have to execute playbook only

```shell
ansible-playbook -i hosts site.yml
```

## Running Test Cases for Setup

For running the test cases, we have a seperate folder named [inspec](./inspec). Inspec (https://www.inspec.io/) should be installed if you want to run the test cases.

Command which needs to be run

```shell
inspec exec . -t ssh://username@server_ip -i /path/to/keyfile
```

## Author
**[Abhishek Dubey](mailto:abhishek.dubey@opstree.com)**
