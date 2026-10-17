for v in blue green; do
kubectl -n "$NS" apply -f - <<YAML
apiVersion: apps/v1
kind: Deployment
metadata: {name: app-$v}
spec:
  replicas: 2
  selector: {matchLabels: {app: shop, version: $v}}
  template:
    metadata: {labels: {app: shop, version: $v}}
    spec: {containers: [{name: web, image: "nginx:1.27"}]}
YAML
done
kubectl -n "$NS" create service clusterip shop --tcp=80:80
kubectl -n "$NS" set selector service shop app=shop,version=blue
