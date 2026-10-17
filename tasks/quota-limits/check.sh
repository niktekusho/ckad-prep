. "$(dirname "$0")/../lib.sh"
is "quota pods"       "$(jp resourcequota/team-quota '{.spec.hard.pods}')" "5"
is "quota cpu"        "$(jp resourcequota/team-quota '{.spec.hard.requests\.cpu}')" "1"
is "quota memory"     "$(jp resourcequota/team-quota '{.spec.hard.requests\.memory}')" "1Gi"
is "plain cpu req"    "$(jp pod/plain '{.spec.containers[0].resources.requests.cpu}')" "100m"
is "plain mem req"    "$(jp pod/plain '{.spec.containers[0].resources.requests.memory}')" "128Mi"
is "plain running"    "$(jp pod/plain '{.status.phase}')" "Running"
finish
