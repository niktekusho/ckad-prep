. "$(dirname "$0")/../lib.sh"
is "replicas"  "$(jp deploy/web '{.spec.replicas}')" "2"
cm=$(kc get cm -o name | grep web-config | head -1)
is "configmap exists" "$([ -n "$cm" ] && echo yes)" "yes"
is "LOG_LEVEL value" "$(kc get "$cm" -o jsonpath='{.data.LOG_LEVEL}')" "debug"
has "envFrom ref" "$(jp deploy/web '{.spec.template.spec.containers[0].envFrom[*].configMapRef.name}')" "web-config"
is "env reaches pod" "$(kc wait --for=condition=Available deploy/web --timeout=60s >/dev/null && kc exec deploy/web -- printenv LOG_LEVEL)" "debug"
finish
