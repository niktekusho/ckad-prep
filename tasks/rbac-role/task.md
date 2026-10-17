domain: config-security
budget: 6
---
Create ServiceAccount `reporter`. Give it permission to get, list and watch Pods in this namespace,
and nothing else, using a Role `pod-reader` and a RoleBinding `reporter-pods`.
