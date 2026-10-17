. "$(dirname "$0")/../lib.sh"
is "api image nginx:1.27" "$(jp deploy/api '{.spec.template.spec.containers[0].image}')" "nginx:1.27"
is "api rolled back"      "$(helm -n "$NS" history api 2>/dev/null | tail -1 | grep -c 'Rollback to 1')" "1"
is "old uninstalled"      "$(helm -n "$NS" list -q 2>/dev/null | grep -c '^old$')" "0"
finish
