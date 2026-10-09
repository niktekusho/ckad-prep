. "$(dirname "$0")/../lib.sh"
is  "tail is a native sidecar" "$(jp pod/logger '{.spec.initContainers[?(@.name=="tail")].restartPolicy}')" "Always"
has "logs is an emptyDir"      "$(jp pod/logger '{.spec.volumes[?(@.name=="logs")]}')" "emptyDir"
is  "app mounts /var/log"      "$(jp pod/logger '{.spec.containers[?(@.name=="app")].volumeMounts[?(@.name=="logs")].mountPath}')" "/var/log"
is  "tail mounts /var/log"     "$(jp pod/logger '{.spec.initContainers[?(@.name=="tail")].volumeMounts[?(@.name=="logs")].mountPath}')" "/var/log"
is  "pod running"              "$(jp pod/logger '{.status.phase}')" "Running"
has "tail shows dates"         "$(kc logs logger -c tail --tail=1)" "20"
finish
