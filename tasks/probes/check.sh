. "$(dirname "$0")/../lib.sh"
c=.spec.template.spec.containers[0]
is "readiness path"   "$(jp deploy/probe-app "{$c.readinessProbe.httpGet.path}")" "/"
is "readiness port"   "$(jp deploy/probe-app "{$c.readinessProbe.httpGet.port}")" "80"
is "readiness period" "$(jp deploy/probe-app "{$c.readinessProbe.periodSeconds}")" "5"
is "liveness tcp"     "$(jp deploy/probe-app "{$c.livenessProbe.tcpSocket.port}")" "80"
is "liveness delay"   "$(jp deploy/probe-app "{$c.livenessProbe.initialDelaySeconds}")" "10"
is "updated/ready"    "$(jp deploy/probe-app '{.status.updatedReplicas}/{.status.readyReplicas}')" "2/2"
finish
