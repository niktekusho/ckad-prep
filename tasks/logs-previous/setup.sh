code=$(od -An -N2 -tu2 /dev/urandom | tr -d ' ')
kubectl -n "$NS" run flaky --image=busybox:1.36 --command -- sh -c "echo starting; echo 'FATAL: lost connection, code $code'; sleep 3; exit 1"
mkdir -p /tmp/ckad; rm -f /tmp/ckad/flaky.txt
