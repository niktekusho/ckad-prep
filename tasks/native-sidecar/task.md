domain: design-build
budget: 7
---
Create a Pod named `logger` with:
- a container `app` (image `busybox:1.36`) running
  `sh -c 'while true; do date >> /var/log/app.log; sleep 5; done'`
- an emptyDir volume `logs` mounted at `/var/log` in every container
- a sidecar `tail` (image `busybox:1.36`) running `tail -F /var/log/app.log`.
  Use the native sidecar pattern: it must start before `app` and keep running for the Pod's whole life.

Wait a few seconds after the Pod starts before checking.
