domain: networking
budget: 6
---
Pods `db`, `api` and `other` exist. Create NetworkPolicy `db-allow` so that Pods labelled `app=db`
accept incoming traffic only from Pods labelled `app=api` in this namespace, on TCP port 5432.
Block all other incoming traffic to the db Pods. Don't affect any other Pods.
