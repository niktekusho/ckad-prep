. "$(dirname "$0")/../lib.sh"
sa=system:serviceaccount:$NS:reporter
can() { kubectl -n "$NS" auth can-i "$@" --as="$sa" 2>/dev/null; }
is "role pod-reader"      "$(jp role/pod-reader '{.metadata.name}')" "pod-reader"
is "binding uses role"    "$(jp rolebinding/reporter-pods '{.roleRef.name}')" "pod-reader"
is "can list pods"        "$(can list pods)" "yes"
is "can watch pods"       "$(can watch pods)" "yes"
is "cannot delete pods"   "$(can delete pods)" "no"
is "cannot list secrets"  "$(can list secrets)" "no"
finish
