#!/bin/sh

docker pull consul

  docker run \
    -d \
    -p 8500:8500 \
    -p 8600:8600/udp \
    --name=consul-srv-1 \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "server":true
        }' \
    consul agent -server -ui -node=consul-srv-1 -bootstrap-expect=1 -client=0.0.0.0