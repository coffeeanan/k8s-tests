#!/bin/bash


kubectl create namespace monitoring
kubectl create -f clusterRole.yamlwww
kubectl create -f config-map.yaml







