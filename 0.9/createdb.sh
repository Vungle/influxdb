#!/bin/bash
if [ -n "${PRE_CREATE_DB}" ]; then
  echo "=> About to create the following database: ${PRE_CREATE_DB}"
  #wait for the startup of influxdb
  echo "=> Creating database: ${x}"
  /usr/bin/influx -execute="create database \"${PRE_CREATE_DB}\""
fi
