#!/bin/sh

 docker run \
     --network dev-network \
    -d \
    --name=consul-srv-2 \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "server":true,
        "connect": {"enabled":true}
        }' \
    consul:1.10.0 agent -server -ui -node=consul-srv-2 -bootstrap-expect=3 -client=0.0.0.0 -retry-join="consul-srv-1" -retry-join="consul-srv-2" -retry-join="consul-srv-3"

sleep 5

 docker run \
     --network dev-network \
    -d \
    --name=consul-srv-3 \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "server":true,
        "connect": {"enabled":true}
        }' \
    consul:1.10.0 agent -server -ui -node=consul-srv-3 -bootstrap-expect=3 -client=0.0.0.0 -retry-join="consul-srv-1" -retry-join="consul-srv-2" -retry-join="consul-srv-3"
