#!/bin/sh

docker pull hashicorp/counting-service:0.0.2

docker run \
    --network dev-network \
   -p 9001:9001 \
   -d \
   --name=counting-service \
   hashicorp/counting-service:0.0.2


docker exec consul-client /bin/sh -c "echo '{\"service\": {\"name\": \"counting\", \"tags\": [\"go\"], \"port\": 9001}}' >> /consul/config/counting.json"

docker exec consul-client consul reload

sleep 10
clear
dig @127.0.0.1 -p 8600 counting.service.consul