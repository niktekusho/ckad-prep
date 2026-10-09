. "$(dirname "$0")/../lib.sh"
is "image"          "$(jp deploy/checkout '{.spec.template.spec.containers[0].image}')" "nginx:1.27-alpine"
is "probe kept"     "$(jp deploy/checkout '{.spec.template.spec.containers[0].readinessProbe.httpGet.port}')" "80"
is "ready replicas" "$(jp deploy/checkout '{.status.readyReplicas}')" "2"
finish
