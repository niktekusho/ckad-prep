# Notes

## Preferences
- Terminal-only tasks: `kubectl`, `nano`, kubernetes.io docs. Timed. About 1 hour per weekday.
- Track weak domains and time per task (`progress/log.csv`, `./drill stats`) and adapt each session.
- A 2-hour mock at the end of each week (Saturday by default).

## Writing tasks for every machine
`docs/setup.md` describes the three practice clusters. Tasks must pass on all of them:
- Avoid features newer than v1.29, the work PC's version. Mention them in lessons when the exam (v1.37) differs.
- Ingress and NetworkPolicy checks test the object spec, because the work PC enforces neither.
- Keep `drill` and `check.sh` working on macOS bash 3.2 and BSD tools: no `sed -i`, `grep -P`, `date -d`, `declare -A`.
- Kustomize is built into kubectl (`kubectl apply -k`), so it needs no install.

## How sessions work
- Session N: read `./drill stats` and `progress/log.csv`, write the next `sets/*.txt`, weighting weak domains
  but interleaving every domain. Reuse old tasks for spaced repetition and add new ones under `tasks/`.
- If a session has a lesson, put `# lesson: lessons/NNNN-<name>.html` as a comment line in its set. `./drill` prints it.
- Name each review `learning-records/NNNN-<set>-review.md`. `./drill` treats a set with no such file as unreviewed.
- Keep one pending set at a time. `./drill` picks the newest if there are several.
- Solutions stay out of the repo. After a session, review the failed tasks with the learner.

## Plan (exam not booked; assume about 4 weeks)
- Week 1 (Oct 9-18): diag-01, retry-01, session-02 (Helm + Kustomize) on Oct 17. Mock 1 moved to Sun Oct 18.
- Week 2 (Oct 19-24): weak domains, speed. Mock 2 on Sat Oct 24.
- Week 3 (Oct 26-31): killer.sh session 1. Mock 3 on Sat Oct 31.
- Week 4: killer.sh session 2, light review. Mock 4 a few days before the exam.

## Backlog of topics not in diag-01
CRDs (`kubectl get crd`, using a custom resource), API deprecations (`kubectl convert` not
available, read the deprecation guide), `kubectl top`/events, docker image build.
