kubectl -n "$NS" apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: shop-v1}
spec:
  replicas: 5
  selector: {matchLabels: {app: shop, version: v1}}
  template:
    metadata: {labels: {app: shop, version: v1}}
    spec: {containers: [{name: nginx, image: "nginx:1.25"}]}
---
apiVersion: v1
kind: Service
metadata: {name: shop}
spec:
  selector: {app: shop}
  ports: [{port: 80}]
Y
