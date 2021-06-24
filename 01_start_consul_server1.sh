#!/bin/sh

docker pull consul

docker network rm dev-network

#start Vault in dev mode on port 8200
docker network create dev-network


  docker run \
    --network dev-network \
    -d \
    -p 8500:8500 \
    -p 8600:8600/udp \
    --name=consul-srv-1 \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "server":true
        }' \
    consul agent -server -ui -node=consul-srv-1 -bootstrap-expect=3 -client=0.0.0.0 -retry-join="consul-srv-1" -retry-join="consul-srv-2" -retry-join="consul-srv-3"