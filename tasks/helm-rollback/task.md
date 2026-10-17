domain: deployment
budget: 6
---
Someone upgraded Helm release `api` in this namespace and its Pods no longer start.
1. Roll `api` back to the last revision that worked.
2. Uninstall release `old`.
