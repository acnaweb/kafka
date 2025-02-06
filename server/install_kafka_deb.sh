#!/bin/bash

export KAFKA_VERSION=7.7.1
export CONFLUENT_HOME=/opt/confluent-${KAFKA_VERSION}
export CONFLUENT_FILE=confluent-community-${KAFKA_VERSION}

rm -rf $CONFLUENT_HOME
mkdir -p $CONFLUENT_HOME
rm -f ${CONFLUENT_FILE}.tar.gz
wget https://packages.confluent.io/archive/7.7/${CONFLUENT_FILE}.tar.gz
tar xzf ${CONFLUENT_FILE}.tar.gz --directory /opt
rm -f ${CONFLUENT_FILE}.tar.gz
cp -r etc/* $CONFLUENT_HOME/etc
export PATH=$PATH:$CONFLUENT_HOME/bin

wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/1.9.8.Final/debezium-connector-mysql-1.9.8.Final-plugin.tar.gz