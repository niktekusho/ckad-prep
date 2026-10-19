domain: config-security
budget: 7
---
A CustomResourceDefinition for `Backup` objects already exists in the cluster.
1. Find out its API group, its scope, and which spec fields it has. Use `kubectl` only.
2. In namespace `crd-use`, create a `Backup` named `nightly` with `schedule: "0 2 * * *"` and `target: db`.
3. Write the names of all `Backup` objects in `crd-use` (one per line, no prefix) to `/tmp/ckad/crd-use/backups.txt`.
