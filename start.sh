#!/bin/bash

if [ "x$1" == "x" ]; then
  echo "USAGE: docker run grahamc/rabbitmq-perftest amqp://user:password@host/vhost"
  echo ""
  echo "Basic user setup:"
  echo " $ rabbitmqctl add_user user password"
  echo " $ rabbitmqctl set_user_tags user administrator"
  echo " $ rabbitmqctl set_permissions -p / user '.*' '.*' '.*'"
  exit 1
fi

exec /data/client/bin/runjava com.rabbitmq.perf.PerfTest $@
