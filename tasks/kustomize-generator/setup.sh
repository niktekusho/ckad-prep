d=/tmp/ckad/kg; rm -rf "$d"; mkdir -p "$d/base"
cat > "$d/base/kustomization.yaml" <<'YAML'
resources:
- deployment.yaml
YAML
kubectl create deployment web --image=nginx:1.27 --dry-run=client -o yaml > "$d/base/deployment.yaml"
