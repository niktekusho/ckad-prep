domain: config-security
budget: 6
---
1. Create ResourceQuota `team-quota` that limits this namespace to 5 Pods, 1 CPU of requests
   and 1Gi of memory requests.
2. Create LimitRange `defaults` that gives every container without its own values
   a request of `100m` CPU and `128Mi` memory.
3. Create Pod `plain` (image `nginx:1.27`) with no resources set. It must start.
