domain: deployment
budget: 5
---
Deployments `app-blue` and `app-green` both run in this namespace. Service `shop` sends traffic to blue.
Switch all of `shop`'s traffic to green with no downtime, then scale `app-blue` to 0.
