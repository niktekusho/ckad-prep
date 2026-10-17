domain: deployment
budget: 8
---
A Kustomize base is in `/tmp/ckad/kz/base`. Don't edit it.
Create an overlay in `/tmp/ckad/kz/prod` that:
- puts everything in namespace `kustomize-overlay`
- prefixes every name with `prod-`
- adds the label `env: prod`
- uses image `nginx:1.27`
- sets the Deployment to 3 replicas

Apply the overlay with kubectl.
