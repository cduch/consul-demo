#!/bin/bash

helm install -f resources/config.yaml consul hashicorp/consul --version "0.32.0"

kubectl get pods -w 

echo "open your browser and use the url to view the consul Web UI: http://localhost:8500"

kubectl port-forward consul-server-0 8500:8500

