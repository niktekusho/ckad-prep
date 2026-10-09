. "$(dirname "$0")/../lib.sh"
is "cm MODE"           "$(jp cm/app-cfg '{.data.MODE}')" "prod"
is "secret pass"       "$(jp secret/db-cred '{.data.pass}' | base64 -d)" "s3cr3t"
is "env MODE in pod"   "$(kc exec cfg-pod -- printenv MODE)" "prod"
is "env LEVEL in pod"  "$(kc exec cfg-pod -- printenv LEVEL)" "debug"
is "env DB_PASS"       "$(kc exec cfg-pod -- printenv DB_PASS)" "s3cr3t"
is "file /etc/db/user" "$(kc exec cfg-pod -- cat /etc/db/user)" "admin"
is "mount read-only"   "$(jp pod/cfg-pod '{.spec.containers[0].volumeMounts[?(@.mountPath=="/etc/db")].readOnly}')" "true"
finish
