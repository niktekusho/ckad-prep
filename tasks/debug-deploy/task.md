domain: observability
budget: 5
---
Deployment `checkout` has no ready Pods. Find and fix every problem so both replicas become ready.
Rules: don't delete the Deployment, keep a readiness probe, and use the nginx 1.27 alpine image.
