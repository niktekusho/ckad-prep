domain: config-security
budget: 7
---
Create ServiceAccount `runner`. Then create Pod `secure` (image `busybox:1.36`, command `sleep 3600`) that:
- runs as ServiceAccount `runner` without mounting its API token
- runs as user 1000 and group 3000 (set at Pod level)
- in the container: disallows privilege escalation, uses a read-only root filesystem, drops ALL capabilities
- requests 100m CPU and 64Mi memory, limits 200m CPU and 128Mi memory
