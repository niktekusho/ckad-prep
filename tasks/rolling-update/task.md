domain: deployment
budget: 6
---
Create a Deployment `api` with image `nginx:1.25` and 3 replicas.
Configure its update strategy so a rollout never drops below 3 available Pods and adds at most 1 extra Pod.
Then roll it out to image `nginx:1.27`.
