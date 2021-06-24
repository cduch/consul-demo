#!/bin/sh

docker run \
--name=consul-client \
-e CONSUL_LOCAL_CONFIG='{
    "datacenter":"bielefeld"
    }' \
consul agent -node=consul-client -client=0.0.0.0 -join=172.17.0.2