domain: deployment
budget: 7
---
Deployment `shop-v1` (5 replicas) sits behind Service `shop`.
Release a canary: create Deployment `shop-v2` with image `nginx:1.27`, so that the Service sends
about 20% of its traffic to v2. Keep exactly 5 Pods behind the Service in total.
Do not modify the Service.
