#!/bin/bash

export KAFKA_VERSION=7.7.1
export CONFLUENT_HOME=/opt/confluent-${KAFKA_VERSION}
export CONFLUENT_FILE=confluent-community-${KAFKA_VERSION}

rm -rf $CONFLUENT_HOME
mkdir -p $CONFLUENT_HOME
rm -f ${CONFLUENT_FILE}.zip
wget https://packages.confluent.io/archive/7.7/${CONFLUENT_FILE}.zip
unzip -o ${CONFLUENT_FILE}.zip
mv confluent-${KAFKA_VERSION}/ /opt
rm -f ${CONFLUENT_FILE}.zip

export PATH=$PATH:$CONFLUENT_HOME/bin