. "$(dirname "$0")/../lib.sh"
d=deploy/clock
is  "writer is a native sidecar" "$(jp $d '{.spec.template.spec.initContainers[?(@.name=="writer")].restartPolicy}')" "Always"
is  "web mounts html"            "$(jp $d '{.spec.template.spec.containers[?(@.name=="web")].volumeMounts[?(@.name=="html")].mountPath}')" "/usr/share/nginx/html"
has "html is an emptyDir"        "$(jp $d '{.spec.template.spec.volumes[?(@.name=="html")]}')" "emptyDir"
is  "2 ready replicas"           "$(jp $d '{.status.readyReplicas}')" "2"
has "nginx serves the date"      "$(kc exec $d -c web -- curl -s localhost)" "20"
finish
