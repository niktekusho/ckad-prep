domain: deployment
budget: 8
---
A Kustomize base is in `/tmp/ckad/kg/base`. Don't edit it. It has a Deployment `web`.
Create `/tmp/ckad/kg/dev/kustomization.yaml` that, using only what you find on kubernetes.io:
- uses the base and puts everything in namespace `kustomize-generator`
- generates a ConfigMap `web-config` with `LOG_LEVEL=debug` (literal)
- makes the `web` container read all keys of `web-config` as environment variables (patch the Deployment)
- sets the Deployment to 2 replicas

Apply it with kubectl. Hint: the generated ConfigMap name gets a hash suffix, so do not hard-code it in the patch.
