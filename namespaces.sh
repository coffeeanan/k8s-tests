#!/bin/bash

kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: jungle
  labels:
    istio-injection: enabled

---
apiVersion: v1
kind: LimitRange
metadata:
  name: jungle
  namespace: jungle
spec:
  limits:
  - max:
      cpu: "4"
      memory: 6Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: "3"
      memory: 5Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container

---
apiVersion: v1
kind: Namespace
metadata:
  name: atest
  labels:
    istio-injection: enabled

---
apiVersion: v1
kind: LimitRange
metadata:
  name: atest
  namespace: atest
spec:
  limits:
  - max:
      cpu: "4"
      memory: 6Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: "3"
      memory: 5Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container

---
apiVersion: v1
kind: Namespace
metadata:
  name: dev-portal
  labels:
    istio-injection: disabled

---
apiVersion: v1
kind: LimitRange
metadata:
  name: dev-portal
  namespace: dev-portal
spec:
  limits:
  - max:
      cpu: "3"
      memory: 4Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: "2"
      memory: 3Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container

---
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
  labels:
    istio-injection: disabled
    name: monitoring

---
apiVersion: v1
kind: LimitRange
metadata:
  name: monitoring
  namespace: monitoring
spec:
  limits:
  - max:
      cpu: "2"
      memory: 8Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: 1200m
      memory: 6Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container

---
apiVersion: v1
kind: Namespace
metadata:
  name: logging
  labels:
    name: logging
    control-plane: elastic-operator
    istio-injection: disabled
---
apiVersion: v1
kind: LimitRange
metadata:
  name: logging
  namespace: logging
spec:
  limits:
  - max:
      cpu: "2"
      memory: 6Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: 2000m
      memory: 6Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container

---
apiVersion: v1
kind: Namespace
metadata:
  name: metrics

---
apiVersion: v1
kind: Namespace
metadata:
  name: cert-manager
  labels:
    istio-injection: disabled

---
apiVersion: v1
kind: LimitRange
metadata:
  name: cert-manager
  namespace: cert-manager
spec:
  limits:
  - max:
      cpu: "3"
      memory: 4Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: "2"
      memory: 3Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container
---
apiVersion: v1
kind: Namespace
metadata:
  name: sumologic-aggregator
  labels:
    istio-injection: disabled
---
apiVersion: v1
kind: LimitRange
metadata:
  name: sumologic-aggregator
  namespace: sumologic-aggregator
spec:
  limits:
  - max:
      cpu: "3"
      memory: 6Gi
    min:
      cpu: 10m
      memory: 5Mi
    type: Pod
  - default:
      cpu: 500m
      memory: 1Gi
    defaultRequest:
      cpu: 50m
      memory: 100Mi
    max:
      cpu: "2"
      memory: 5Gi
    min:
      cpu: 10m
      memory: 3Mi
    type: Container
EOF
