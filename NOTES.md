# Notes

## Preferences
- Terminal-only tasks: `kubectl`, `vim`, kubernetes.io docs. Timed. About 1 hour per weekday.
- Track weak domains and time per task (`progress/log.csv`, `./drill stats`) and adapt each session.
- A 2-hour mock at the end of each week (Saturday by default).

## Environment (this machine)
- Docker Desktop 4.32, kubeadm provisioner, Kubernetes v1.29.2, single node. No admin rights, so no upgrade.
- Git Bash. Needs `export MSYS_NO_PATHCONV=1`, or Git Bash rewrites `/etc/...` arguments into Windows paths.
- helm v3.15 is installed. Kustomize is built into kubectl (`kubectl apply -k`).
- No ingress controller and no NetworkPolicy enforcement. Tasks check the object spec only.
- Avoid features newer than v1.29 in local tasks. Mention them in lessons when the exam (v1.37) differs.

## How sessions work
- Session N: read `./drill stats` and `progress/log.csv`, write the next `sets/*.txt`, weighting weak domains
  but interleaving every domain. Reuse old tasks for spaced repetition and add new ones under `tasks/`.
- Solutions stay out of the repo. After a session, review the failed tasks with the learner.

## Plan (exam not booked; assume about 4 weeks)
- Week 1 (Oct 9-17): diag-01, then Helm + Kustomize, then weak domains. Mock 1 on Sat Oct 17.
- Week 2 (Oct 19-24): weak domains, speed. Mock 2 on Sat Oct 24.
- Week 3 (Oct 26-31): killer.sh session 1. Mock 3 on Sat Oct 31.
- Week 4: killer.sh session 2, light review. Mock 4 a few days before the exam.

## Backlog of topics not in diag-01
Helm (install/upgrade/rollback, values), Kustomize, Jobs (completions/parallelism), PVC volumes, Role/RoleBinding,
ResourceQuota/LimitRange, CRDs (`kubectl get crd`, using a custom resource), API deprecations (`kubectl convert` not
available, read the deprecation guide), `kubectl top`/events/logs, blue/green with Service selector swap, docker image build.
