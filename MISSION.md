# Mission: pass the CKAD

## Why
Pass the Certified Kubernetes Application Developer exam in early November 2026 (not booked yet as of 2026-10-09). The exam is 2 hours of hands-on tasks in a terminal, with a 66% pass mark.

## Success looks like
- Finish a 2-hour mock of about 16 tasks with 75% or more, leaving time to review.
- Solve a typical task within its time budget using only `kubectl`, `vim` and kubernetes.io/docs.
- No domain below a 70% pass rate in `./drill stats`.

## Constraints
- About 1 hour per weekday, plus one 2-hour mock at the end of each week.
- Practice cluster is Docker Desktop's Kubernetes v1.29 (no admin rights to upgrade). The exam runs v1.37.
- This cluster has no ingress controller and does not enforce NetworkPolicies. Tasks check the object spec.
- Allowed during the exam: kubernetes.io/docs, kubernetes.io/blog, helm.sh/docs.

## Out of scope
- Cluster administration (CKA topics: etcd, kubeadm, node setup).
- Gateway API (CKA only).
