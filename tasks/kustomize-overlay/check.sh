. "$(dirname "$0")/../lib.sh"
is "overlay uses base"  "$(grep -c '\.\./base' /tmp/ckad/kz/prod/kustomization.yaml 2>/dev/null)" "1"
is "base untouched"     "$(grep -c 'nginx:1.26' /tmp/ckad/kz/base/deployment.yaml 2>/dev/null)" "1"
is "prod-web exists"    "$(jp deploy/prod-web '{.metadata.name}')" "prod-web"
is "label env=prod"     "$(jp deploy/prod-web '{.metadata.labels.env}')" "prod"
is "image nginx:1.27"   "$(jp deploy/prod-web '{.spec.template.spec.containers[0].image}')" "nginx:1.27"
is "3 replicas"         "$(jp deploy/prod-web '{.spec.replicas}')" "3"
finish
