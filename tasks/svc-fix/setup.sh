kubectl -n "$NS" create deploy catalog --image=nginx:1.27 --replicas=2
kubectl -n "$NS" apply -f - <<'Y'
apiVersion: v1
kind: Service
metadata: {name: catalog-svc}
spec:
  selector: {app: catlog}
  ports: [{port: 80, targetPort: 8080}]
Y
