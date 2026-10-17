. "$(dirname "$0")/../lib.sh"
is "selector version=green" "$(jp svc/shop '{.spec.selector.version}')" "green"
is "selector app=shop"      "$(jp svc/shop '{.spec.selector.app}')" "shop"
is "2 green endpoints"      "$(jp endpoints/shop '{range .subsets[*].addresses[*]}x{end}')" "xx"
is "blue scaled to 0"       "$(jp deploy/app-blue '{.spec.replicas}')" "0"
is "green still 2"          "$(jp deploy/app-green '{.spec.replicas}')" "2"
finish
