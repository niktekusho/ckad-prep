domain: design-build
budget: 5
---
Create a Job `batch` (image `busybox:1.36`, command `sh -c 'echo ok'`) that must complete 6 times,
running at most 2 Pods at once, and gives up after 2 failed retries.

Wait for the Job to complete before checking.
