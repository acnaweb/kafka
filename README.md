# Kafka

Apache Kafka is an open-source distributed event streaming platform used

## Setup

### Install Ubuntu

- https://docs.confluent.io/platform/current/installation/installing_cp/deb-ubuntu.html

```sh
wget -qO - https://packages.confluent.io/deb/7.7/archive.key | sudo apt-key add -
echo "deb [arch=amd64] https://packages.confluent.io/deb/7.7 stable main" | sudo tee /etc/apt/sources.list.d/confluent.list
echo "deb https://packages.confluent.io/clients/deb $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/confluent.list
sudo apt update && sudo apt install -y confluent-platform
```

### Install Kafka

- https://www.confluent.io/installation/

```sh
nano ~/.bashrc
```

> - export KAFKA_VERSION=7.7.1
> - export CONFLUENT_HOME=/opt/confluent-${KAFKA_VERSION}
> - export PATH=$PATH:$CONFLUENT_HOME/bin

```sh
source ~/.bashrc
```

```sh
nano $CONFLUENT_HOME/etc/kafka/server.properties
```

> - listeners=PLAINTEXT://0.0.0.0:9092
> - advertised.listeners=PLAINTEXT://localhost:9092
> - listener.security.protocol.map=PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL

#### Services

Check confluent services:

```sh
confluent local services status
```

Start Confluent Kafka:
```sh
confluent local services kafka start
```

Stopping all confluent services:
```sh
confluent local services stop
```

Stop only Confluent Kafka service:

```sh
confluent local services kafka stop
```

### Install Kafka Connect

### Confluent Hub

https://docs.confluent.io/confluent-cli/current/command-reference/connect/plugin/confluent_connect_plugin_install.html

https://docs.confluent.io/platform/current/connect/confluent-hub/index.html

### Docker

```sh
wget https://raw.githubusercontent.com/confluentinc/cp-all-in-one/7.7.1-post/cp-all-in-one-kraft/docker-compose.yml
```

```sh
docker compose up -d
```

### Debezium

```sh
wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/1.9.8.Final/debezium-connector-mysql-1.9.8.Final-plugin.tar.gz
```

## Usage

- Control Center - http://localhost:9021
- Schema Registry - http://localhost:8081/
- Kafka Connect - http://localhost:8083/
- Connector plugins - http://localhost:8083/connector-plugins

### Mock Data

https://www.confluent.io/hub/confluentinc/kafka-connect-datagen

## References

- https://kafka.apache.org/
- https://github.com/confluentinc/examples
- https://github.com/fabiogjardim/lab