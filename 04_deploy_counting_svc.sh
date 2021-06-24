#!/bin/sh

docker pull hashicorp/counting-service:0.0.2

docker run --network dev-network -p 9001:9001 -d -e PORT=9001 --name=counting-service hashicorp/counting-service:0.0.2

docker exec consul-client consul connect proxy -sidecar-for counting-1 > counting-proxy.log &