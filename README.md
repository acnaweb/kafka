# Kafka

Apache Kafka is an open-source distributed event streaming platform used

## Setup

### Install

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

### Services

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

### Docker

```sh
wget https://raw.githubusercontent.com/confluentinc/cp-all-in-one/7.7.1-post/cp-all-in-one-kraft/docker-compose.yml
```

```sh
docker compose up -d
```

## Usage

- Control Center - http://localhost:9021
- Schema Registry - http://localhost:8081/

### Mock Data

https://www.confluent.io/hub/confluentinc/kafka-connect-datagen

## References

- https://kafka.apache.org/