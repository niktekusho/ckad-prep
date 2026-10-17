domain: design-build
budget: 7
---
Create a Deployment `clock` with 2 replicas. Each Pod has:
- a container `web` (image `nginx:1.27`) that serves `/usr/share/nginx/html` from an emptyDir volume `html`
- a native sidecar `writer` (image `busybox:1.36`) that mounts `html` at `/html` and runs
  `sh -c 'while true; do date > /html/index.html; sleep 5; done'`

Wait until both replicas are ready before checking.
