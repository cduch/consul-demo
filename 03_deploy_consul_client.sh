#!/bin/sh

docker run \
    --network dev-network \
--name=consul-client \
-e CONSUL_LOCAL_CONFIG='{
    "datacenter":"bielefeld"
    }' \
consul agent -node=consul-client -client=0.0.0.0 -join="consul-srv-1"