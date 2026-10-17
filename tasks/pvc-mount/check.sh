. "$(dirname "$0")/../lib.sh"
is "pvc bound"         "$(jp pvc/data '{.status.phase}')" "Bound"
is "pvc 100Mi"         "$(jp pvc/data '{.spec.resources.requests.storage}')" "100Mi"
is "pvc RWO"           "$(jp pvc/data '{.spec.accessModes[0]}')" "ReadWriteOnce"
is "pod uses claim"    "$(jp pod/store '{.spec.volumes[*].persistentVolumeClaim.claimName}')" "data"
is "mounted at /data"  "$(jp pod/store '{.spec.containers[0].volumeMounts[?(@.mountPath=="/data")].mountPath}')" "/data"
is "note.txt saved"    "$(kc exec store -- cat /data/note.txt)" "saved"
finish
