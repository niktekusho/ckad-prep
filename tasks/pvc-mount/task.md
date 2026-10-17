domain: design-build
budget: 6
---
1. Create PersistentVolumeClaim `data` requesting 100Mi with access mode ReadWriteOnce.
   Use the cluster's default StorageClass.
2. Create Pod `store` (image `busybox:1.36`, command `sleep 3600`) that mounts the claim at `/data`.
3. In the Pod, write the text `saved` to `/data/note.txt`.
