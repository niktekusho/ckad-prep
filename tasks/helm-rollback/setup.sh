chart="$(dirname "$0")/../../charts/web"
helm -n "$NS" install api "$chart" --set image.tag=1.27
helm -n "$NS" upgrade api "$chart" --set image.tag=1.27-broken
helm -n "$NS" install old "$chart"
