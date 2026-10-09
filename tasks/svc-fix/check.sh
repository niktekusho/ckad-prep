. "$(dirname "$0")/../lib.sh"
is "catalog-svc endpoints"  "$(jp endpoints/catalog-svc '{.subsets[*].addresses[*].ip}' | wc -w | tr -d ' ')" "2"
is "catalog-svc targets 80" "$(jp svc/catalog-svc '{.spec.ports[0].targetPort}')" "80"
is "catalog-np type"        "$(jp svc/catalog-np '{.spec.type}')" "NodePort"
is "catalog-np nodePort"    "$(jp svc/catalog-np '{.spec.ports[0].nodePort}')" "30080"
is "catalog-np endpoints"   "$(jp endpoints/catalog-np '{.subsets[*].addresses[*].ip}' | wc -w | tr -d ' ')" "2"
finish
