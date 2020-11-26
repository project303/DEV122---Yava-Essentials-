#!/bin/bash

#hive -f /tmp/user05/load_table05.hql
#hdfs dfs -touchz /user/${HADOOP_USER_NAME}/start_hive_${HADOOP_USER_NAME}
mkdir -p /tmp/${HADOOP_USER_NAME}
hdfs dfs -get /user/${HADOOP_USER_NAME}/script/02-create_table.hql /tmp/${HADOOP_USER_NAME}
#hdfs dfs -touchz /user/${HADOOP_USER_NAME}/download_hive_oozie_${HADOOP_USER_NAME}

if [ -f /tmp/${HADOOP_USER_NAME}/02-create_table.hql ]; then
    beeline -n yava -p yava247 -f /tmp/${HADOOP_USER_NAME}/02-create_table.hql --hivevar db_name=${HADOOP_USER_NAME}
    hdfs dfs -touchz /user/${HADOOP_USER_NAME}/hive-script-done_${HADOOP_USER_NAME}
    rm /tmp/${HADOOP_USER_NAME}/02-create_table.hql
else
#    hdfs dfs -touchz /user/${HADOOP_USER_NAME}/fail_five_oozie_${HADOOP_USER_NAME}
#    hdfs dfs -mkdir -p script/file-ga-ada
fi