#!/bin/sh


docker kill consul-srv-1
docker kill consul-srv-2
docker kill consul-srv-3
docker kill consul-client
docker kill counting-service

docker rm consul-srv-1
docker rm consul-srv-2
docker rm consul-srv-3
docker rm consul-client
docker rm counting-service