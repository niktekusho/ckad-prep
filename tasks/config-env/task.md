domain: config-security
budget: 6
---
1. Create ConfigMap `app-cfg` with `MODE=prod` and `LEVEL=debug`.
2. Create Secret `db-cred` with `user=admin` and `pass=s3cr3t`.
3. Create Pod `cfg-pod` (image `nginx:1.27`) that:
   - loads every key of `app-cfg` as environment variables
   - exposes the Secret key `pass` as environment variable `DB_PASS`
   - mounts the whole Secret read-only at `/etc/db`
