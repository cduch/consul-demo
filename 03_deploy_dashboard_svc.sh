#!/bin/bash

kubectl apply -f resources/dashboard.yaml


kubectl get pods -w

echo "open your browser and use the url to view the dashboard service: http://localhost:9002"

kubectl port-forward deploy/dashboard 9002:9002

