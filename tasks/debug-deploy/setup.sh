kubectl -n "$NS" apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: checkout}
spec:
  replicas: 2
  selector: {matchLabels: {app: checkout}}
  template:
    metadata: {labels: {app: checkout}}
    spec:
      containers:
      - name: web
        image: nginx:1.27-alpne
        readinessProbe:
          httpGet: {path: /, port: 8080}
Y
