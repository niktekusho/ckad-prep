. "$(dirname "$0")/../lib.sh"
p=netpol/db-from-backend
is  "targets app=db"       "$(jp $p '{.spec.podSelector.matchLabels}')" '{"app":"db"}'
has "ingress policy"       "$(jp $p '{.spec.policyTypes}')" "Ingress"
is  "one source (AND)"     "$(jp $p '{range .spec.ingress[0].from[*]}x{end}')" "x"
is  "pods app=api"         "$(jp $p '{.spec.ingress[0].from[0].podSelector.matchLabels}')" '{"app":"api"}'
is  "namespaces team=backend" "$(jp $p '{.spec.ingress[0].from[0].namespaceSelector.matchLabels}')" '{"team":"backend"}'
is  "port 5432"            "$(jp $p '{.spec.ingress[0].ports[0].port}')" "5432"
finish
