kubectl -n "$NS" create svc clusterip web-svc --tcp=80:80
kubectl -n "$NS" create svc clusterip api-svc --tcp=80:80
