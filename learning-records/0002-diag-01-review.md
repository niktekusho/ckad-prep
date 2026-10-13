# diag-01: 9 of 11 passed, NetworkPolicy is a blank, speed is the main gap

On 2026-10-13 the learner ran diag-01. 9 of 11 tasks passed. The set took about 82 minutes against a 65-minute budget.

## Gaps
- NetworkPolicy: no prior knowledge. The learner skipped `netpol-ingress` after 12 seconds because they were tired and did not know where to start. `./drill stats` ignores skips, so it shows networking at 100%. Treat networking as weak until a NetworkPolicy task passes.
- Native sidecars: `native-sidecar` failed for two reasons. The `app` container had `args` with a shell loop but no `sh -c`, so it crash-looped. The `tail` sidecar sat under `containers` instead of `initContainers` with `restartPolicy: Always`.
- Speed in config and security: `pod-security` took 2.3x its budget and `config-env` 1.9x. Both passed. `rolling-update` took 1.5x.

## Taught
Lesson `lessons/0002-networkpolicy-from-zero.html` covers NetworkPolicy from zero (selection, allow lists, the one-dash-or-two AND/OR trap, copying from the docs) and the two sidecar fixes. `sets/retry-01.txt` retries both missed tasks.

## Next
Session 2 still adds Helm and Kustomize. Mix in one NetworkPolicy task with a namespaceSelector, one sidecar task, and timed config and security tasks to bring their time toward budget.
