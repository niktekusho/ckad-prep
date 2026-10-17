# session-02: 7 of 7 passed, Helm is fast, config and security still over budget

On 2026-10-17 the learner ran session-02 after lesson 0003. All 7 tasks passed in 43 minutes against a 45-minute budget.

| Task | Time / budget | Note |
| --- | --- | --- |
| helm-install | 0.41 | first Helm task |
| helm-rollback | 0.22 | first Helm task |
| kustomize-overlay | 0.96 | the overlay file kept the lesson's comments, so it was copied from lesson 0003, not from kubernetes.io |
| netpol-ns | 1.15 | second NetworkPolicy pass, first with the AND form |
| sidecar-deploy | 1.15 | native sidecar held inside a Deployment |
| pod-security | 1.25 | down from 2.3 in diag-01 |
| config-env | 1.39 | down from 1.9 in diag-01 |

## What this means
- Helm needs no more teaching. Keep one Helm task per mock for spacing.
- Kustomize is not proven. The exam has no lesson to copy from, so the next Kustomize task must be solved from the kubernetes.io page.
- Config and security is the slowest domain (1.70 time/budget over all runs). Both repeats got faster but are still over budget.

## Next
Mock 1 (`sets/mock-01.txt`, Sun Oct 18): 16 tasks, 90 minutes of budget in 120. Six are new and cover backlog topics: Job parallelism, PVC, RBAC, ResourceQuota and LimitRange, blue/green, and `kubectl logs --previous`. Its results pick week 2's weak domains.
