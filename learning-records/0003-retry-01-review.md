# retry-01: both diag-01 misses now pass, still over budget

On 2026-10-15 the learner ran retry-01 after lesson 0002. Both tasks passed.

- `netpol-ingress`: 434 s against a 360 s budget (1.2x). It was a 12-second skip in diag-01, so this is the first NetworkPolicy pass. Networking now counts as covered, but one pass is thin evidence.
- `native-sidecar`: 564 s against a 420 s budget (1.3x), down from a 749 s fail. The `sh -c` and `initContainers` with `restartPolicy: Always` fixes held.

## Where the time went
- Switching back to the task text to copy names and requirements, one at a time.
- Finding the NetworkPolicy page in the docs.
- The `tail` sidecar failed at first because `/var/log/app.log` did not exist yet (the sidecar starts before `app`), and the learner had to look up the init container command syntax.

## Next
Session 2 as planned in 0002: Helm and Kustomize, one NetworkPolicy task with a namespaceSelector, one sidecar task, and timed config and security tasks.
