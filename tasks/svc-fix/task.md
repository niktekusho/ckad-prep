domain: networking
budget: 5
---
Service `catalog-svc` (port 80) does not reach the Pods of Deployment `catalog`. Fix the Service.
Then expose the same Pods with a second Service `catalog-np` of type NodePort on node port 30080.
