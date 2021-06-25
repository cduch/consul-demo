#!/bin/bash


kubectl delete -f resources/deny.yaml
kubectl delete -f resources/dashboard.yaml
kubectl delete -f resources/counting.yaml

helm uninstall consul