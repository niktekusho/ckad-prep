. "$(dirname "$0")/../lib.sh"
path() { jp ing/shop-ing "{.spec.rules[0].http.paths[?(@.path==\"$1\")].pathType} {.spec.rules[0].http.paths[?(@.path==\"$1\")].backend.service.name}:{.spec.rules[0].http.paths[?(@.path==\"$1\")].backend.service.port.number}"; }
is "host" "$(jp ing/shop-ing '{.spec.rules[0].host}')" "shop.local"
is "/api" "$(path /api)" "Prefix api-svc:80"
is "/"    "$(path /)" "Prefix web-svc:80"
finish
