#!/bin/sh

docker run \
 -d
    --network dev-network \
--name=consul-client \
    -e CONSUL_LOCAL_CONFIG='{
        "datacenter":"bielefeld",
        "connect": {"enabled":true}
        }' \
consul agent -node=consul-client -client=0.0.0.0 -retry-join="consul-srv-1" -retry-join="consul-srv-2" -retry-join="consul-srv-3"




docker exec consul-client /bin/sh -c "echo '{\"service\": {  \"name\": \"counting\",  \"id\": \"counting-1\",  \"port\": 9001,  \"check\": {    \"http\": \"http:\/\/counting-service:9001\/health\",    \"method\": \"GET\",    \"interval\": \"1s\",    \"timeout\": \"1s\"  },  \"connect\": {    \"sidecar_service\": {}  }}}' > /consul/config/counting.json"
docker exec consul-client /bin/sh -c "echo '{\"service\": {  \"name\": \"dashboard\",  \"port\": 9002,  \"connect\": {    \"sidecar_service\": {      \"proxy\": {      \"upstreams\": [{        \"destination_name\": \"counting\",        \"local_bind_port\": 5000      }]    }    }  },  \"check\": {    \"id\": \"dashboard-check\",    \"http\": \"http:\/\/dashboard-service:9002\/health\",    \"method\": \"GET\",    \"interval\": \"1s\",    \"timeout\": \"1s\"  }}}' > /consul/config/dashboard.json"

docker exec consul-client consul reload

sleep 5
docker exec consul-client consul catalog services

sleep 5
docker exec consul-client consul intention create dashboard counting