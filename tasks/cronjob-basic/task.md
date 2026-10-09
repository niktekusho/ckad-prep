domain: design-build
budget: 5
---
Create a CronJob named `backup` that:
- runs every 15 minutes
- uses image `busybox:1.36` and runs the command `date`
- never runs two Jobs at the same time
- keeps only the last 2 successful Jobs
