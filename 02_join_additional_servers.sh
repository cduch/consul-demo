#!/bin/sh

 docker run \
    -d \
    --name=consul-srv-2 \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "server":true
        }' \
    consul agent -server -ui -node=consul-srv-2 -bootstrap-expect=1 -client=0.0.0.0 -join=172.17.0.2


 docker run \
    -d \
    --name=consul-srv-3 \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "server":true
        }' \
    consul agent -server -ui -node=consul-srv-3 -bootstrap-expect=1 -client=0.0.0.0 -join=172.17.0.2
