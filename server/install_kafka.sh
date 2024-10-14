#!/bin/bash

export KAFKA_VERSION=7.7.1

rm -rf /opt/kafka 
mkdir -p /opt/kafka
rm -f confluent-community-${KAFKA_VERSION}.zip
wget https://packages.confluent.io/archive/7.7/confluent-community-${KAFKA_VERSION}.zip
unzip -o confluent-community-${KAFKA_VERSION}.zip
mv confluent-${KAFKA_VERSION}/ /opt/kafka
rm -f confluent-community-${KAFKA_VERSION}.zip
