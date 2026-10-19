mkdir -p /tmp/ckad/crd-use; rm -f /tmp/ckad/crd-use/backups.txt
kubectl apply -f - <<'YAML'
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: backups.drill.example.com
spec:
  group: drill.example.com
  scope: Namespaced
  names:
    plural: backups
    singular: backup
    kind: Backup
    shortNames:
    - bk
  versions:
  - name: v1
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        properties:
          spec:
            type: object
            required: [schedule, target]
            properties:
              schedule:
                type: string
              target:
                type: string
YAML
kubectl wait --for=condition=Established crd/backups.drill.example.com --timeout=30s
kubectl -n "$NS" apply -f - <<'YAML'
apiVersion: drill.example.com/v1
kind: Backup
metadata:
  name: weekly
spec:
  schedule: "0 3 * * 0"
  target: files
YAML
