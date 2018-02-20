#!/bin/bash

# https://hadoop.apache.org/docs/r2.4.1/hadoop-yarn/hadoop-yarn-common/yarn-default.xml

source "/vagrant/scripts/common.sh"

function setupHdfs {
    echo "creating user home directory in hdfs"
    hdfs dfs -mkdir -p /user/root
    hdfs dfs -mkdir -p /user/vagrant
    hdfs dfs -chown vagrant /user/vagrant

    echo "creating temp directories in hdfs"
    hdfs dfs -mkdir -p /tmp
    hdfs dfs -chmod -R 777 /tmp

    hdfs dfs -mkdir -p /var
    hdfs dfs -chmod -R 777 /var
}

setupHdfs

echo "hadoop setup complete"
