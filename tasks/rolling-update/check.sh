. "$(dirname "$0")/../lib.sh"
is "replicas"       "$(jp deploy/api '{.spec.replicas}')" "3"
is "maxUnavailable" "$(jp deploy/api '{.spec.strategy.rollingUpdate.maxUnavailable}')" "0"
is "maxSurge"       "$(jp deploy/api '{.spec.strategy.rollingUpdate.maxSurge}')" "1"
is "image"          "$(jp deploy/api '{.spec.template.spec.containers[0].image}')" "nginx:1.27"
is "ready replicas" "$(jp deploy/api '{.status.readyReplicas}')" "3"
rev=$(jp deploy/api '{.metadata.annotations.deployment\.kubernetes\.io/revision}')
is "rolled out (revision 2+)" "$([ "${rev:-0}" -ge 2 ] && echo yes)" "yes"
finish
