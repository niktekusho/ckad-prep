. "$(dirname "$0")/../lib.sh"
is "release shop deployed" "$(helm -n "$NS" list -q --deployed 2>/dev/null | grep -c "^shop$")" "1"
is "2 replicas"            "$(jp deploy/shop '{.spec.replicas}')" "2"
is "image nginx:1.27"      "$(jp deploy/shop '{.spec.template.spec.containers[0].image}')" "nginx:1.27"
finish
