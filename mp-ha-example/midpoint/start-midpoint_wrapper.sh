#!/bin/bash

if [ "$MP_SCALE_MODE" == "on" ]; then
  # (TODO)
  # [midpoint.nodeId]に[container_name]を代入したいが、現状Dockerの仕様上、
  # そのような変数は存在しない。一旦、[HOSTNAME]を指定する。
  export MP_JAVA_OPTS="$MP_JAVA_OPTS -Dmidpoint.nodeId=$HOSTNAME";
#  export MP_JAVA_OPTS="$MP_JAVA_OPTS -Dmidpoint.nodeIdSource=$HOSTNAME";
  export MP_JAVA_OPTS="$MP_JAVA_OPTS -Dmidpoint.taskManager.clustered=true";
fi

bash -c /usr/local/bin/startup.sh
