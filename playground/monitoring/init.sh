#!/usr/bin/env bash

set -e

machine=$(docker-machine ip)
grafana_port=$(docker-compose port grafana 3000 | cut -d ':' -f 2)

curl -sf -XPOST "http://admin:admin@${machine}:${grafana_port}/api/datasources" \
     -d '{"name":"influx-db1","type":"influxdb","url":"http://influx:8086","database":"db1","user":"root","password":"root","access":"proxy"}' \
     -H 'Content-Type: application/json'

curl -sf -XPOST "http://admin:admin@${machine}:${grafana_port}/api/datasources" \
     -d '{"name":"influx-db2","type":"influxdb","url":"http://influx:8086","database":"db2","user":"root","password":"root","access":"proxy"}' \
     -H 'Content-Type: application/json'
