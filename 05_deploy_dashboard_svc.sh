#!/bin/sh

docker pull hashicorp/dashboard-service:0.0.4

docker run --network dev-network -p 9002:9002 -d -e PORT=9002 -e COUNTING_SERVICE_URL='http://localhost:5000' --name=dashboard-service hashicorp/dashboard-service:0.0.4


docker exec consul-client consul connect proxy -sidecar-for dashboard > dashboard-proxy.log &