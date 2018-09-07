#!/bin/bash

if [ "${AUTHORIZED_KEYS}" != "nil" ]; then
  mkdir -p /home/tomcat/.ssh
  chmod 700 /home/tomcat/.ssh
  touch /home/tomcat/.ssh/authorized_keys
  chmod 600 /home/tomcat/.ssh/authorized_keys
  echo ${AUTHORIZED_KEYS} > /home/tomcat/.ssh/authorized_keys
  chown -R tomcat /home/tomcat/.ssh
fi

exec /usr/sbin/init
