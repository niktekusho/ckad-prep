. "$(dirname "$0")/../lib.sh"
is "v2 image"          "$(jp deploy/shop-v2 '{.spec.template.spec.containers[0].image}')" "nginx:1.27"
is "v2 pods match svc" "$(jp deploy/shop-v2 '{.spec.template.metadata.labels.app}')" "shop"
is "v1 replicas"       "$(jp deploy/shop-v1 '{.spec.replicas}')" "4"
is "v2 replicas"       "$(jp deploy/shop-v2 '{.spec.replicas}')" "1"
is "service unchanged" "$(jp svc/shop '{.spec.selector}')" '{"app":"shop"}'
is "ready endpoints"   "$(jp endpoints/shop '{.subsets[*].addresses[*].ip}' | wc -w | tr -d ' ')" "5"
finish
