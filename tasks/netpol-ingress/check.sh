. "$(dirname "$0")/../lib.sh"
p=netpol/db-allow
is  "targets app=db"    "$(jp $p '{.spec.podSelector.matchLabels}')" '{"app":"db"}'
has "ingress policy"    "$(jp $p '{.spec.policyTypes}')" "Ingress"
is  "one ingress rule"  "$(jp $p '{range .spec.ingress[*]}x{end}')" "x"
is  "from app=api only" "$(jp $p '{.spec.ingress[0].from}')" '[{"podSelector":{"matchLabels":{"app":"api"}}}]'
is  "port 5432"         "$(jp $p '{.spec.ingress[0].ports[0].port}')" "5432"
is  "TCP"               "$(jp $p '{.spec.ingress[0].ports[0].protocol}')" "TCP"
finish
