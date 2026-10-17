domain: networking
budget: 6
---
Pod `db` (label `app=db`) runs in this namespace. Create NetworkPolicy `db-from-backend` so the db Pods
accept incoming traffic on TCP port 5432 only from Pods labelled `app=api` that run in namespaces
labelled `team=backend`. An `app=api` Pod in any other namespace, or any other Pod in a `team=backend`
namespace, must be blocked.
