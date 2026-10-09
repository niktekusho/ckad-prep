domain: observability
budget: 5
---
Deployment `probe-app` exists. Add to its container:
- a readiness probe: HTTP GET `/` on port 80, every 5 seconds
- a liveness probe: TCP check on port 80, first check after 10 seconds

Both replicas must be ready after the rollout.
