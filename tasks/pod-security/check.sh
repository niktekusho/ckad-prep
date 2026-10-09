. "$(dirname "$0")/../lib.sh"
c=.spec.containers[0]
is  "service account"     "$(jp pod/secure '{.spec.serviceAccountName}')" "runner"
is  "token not mounted"   "$(kc exec secure -- sh -c 'test -e /var/run/secrets/kubernetes.io/serviceaccount/token && echo mounted || echo none')" "none"
is  "uid/gid"             "$(kc exec secure -- id -u)/$(kc exec secure -- id -g)" "1000/3000"
is  "runAsUser pod level" "$(jp pod/secure '{.spec.securityContext.runAsUser}')" "1000"
is  "no escalation"       "$(jp pod/secure "{$c.securityContext.allowPrivilegeEscalation}")" "false"
is  "read-only root fs"   "$(jp pod/secure "{$c.securityContext.readOnlyRootFilesystem}")" "true"
has "drop ALL"            "$(jp pod/secure "{$c.securityContext.capabilities.drop}")" "ALL"
is  "requests"            "$(jp pod/secure "{$c.resources.requests.cpu}/{$c.resources.requests.memory}")" "100m/64Mi"
is  "limits"              "$(jp pod/secure "{$c.resources.limits.cpu}/{$c.resources.limits.memory}")" "200m/128Mi"
finish
