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

## Inventory

An inventory should look like this:-

```ini
[all:vars]               # Defined variables for all
ansible_user=ubuntu

[zookeeper]              # Host and Id information for zookeeper
zookeeper1    zookeeper_id=1
zookeeper2    zookeeper_id=2
zookeeper3    zookeeper_id=3

[kafka]                 # Host and broker id information for kafka
kafka1   kafka_broker_id=1
kafka2   kafka_broker_id=2
kafka3   kafka_broker_id=3
```

## Example Playbook

Here is an example playbook:-

```yml
---
- hosts: all
  become: yes
  roles:
    - osm_kafka_cluster
```

## Usage

For using this role you have to execute playbook only

```shell
ansible-playbook -i hosts site.yml
```

## Author
**[Abhishek Dubey](mailto:abhishek.dubey@opstree.com)**
