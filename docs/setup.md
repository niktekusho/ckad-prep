# Practice cluster setup

`drill` deletes namespaces, so it refuses to run unless kubectl points at a local cluster: the context `docker-desktop`, or an API server at `https://127.0.0.1:6443` (k3s and k3d). Every setup also needs `kubectl`, `nano` and `helm`.

| Machine | Cluster | Ingress controller | NetworkPolicy enforced |
|---|---|---|---|
| Work PC (Windows, no admin) | Docker Desktop 4.32, Kubernetes v1.29.2 | no | no |
| Home PC (Windows, admin) | k3s in WSL Ubuntu | Traefik | yes |
| MacBook | k3d (k3s in Docker Desktop) | Traefik | yes |

## Work PC: Docker Desktop

Repo at `/mnt/c/Projects/Workspace/github/ckad-prep`, used from WSL. Without admin rights, neither Docker Desktop nor WSL can be upgraded.

```bash
kubectl config use-context docker-desktop
```

- The WSL kubeconfig is the Windows one, which also holds work clusters (OpenShift, GKE prod). The `drill` guard exists because of them.
- WSL is older than 2.5.1, so the kubelet fails in hybrid cgroup mode with `cgroup ["kubepods"] has some missing paths`. `%USERPROFILE%\.wslconfig` forces cgroup v2: `kernelCommandLine = cgroup_no_v1=all systemd.unified_cgroup_hierarchy=1`.
- helm is not installed in WSL yet.

## Home PC: k3s in WSL

Repo at `/mnt/c/Users/Nicola/projects/ckad-prep`, used from WSL Ubuntu.

1. In an admin PowerShell, run `wsl --install -d Ubuntu` and reboot.
2. k3s needs systemd. New Ubuntu installs have it on; check that `/etc/wsl.conf` contains `systemd=true` under `[boot]`.
3. In Ubuntu:

```bash
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
mkdir -p ~/.kube && cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
kubectl get nodes        # one node, Ready
```

The installer also puts `kubectl` in `/usr/local/bin`. Install helm with the script from helm.sh.

## MacBook: k3d on Docker Desktop

k3d runs k3s inside Docker containers, so the Mac gets the same cluster as the home PC. It can also make multi-node clusters.

1. Update Docker Desktop. In Settings > Kubernetes, leave Kubernetes off: it holds port 6443 and uses memory k3d needs.
2. Install the tools and create the cluster:

```bash
brew install k3d kubectl helm
k3d cluster create ckad --api-port 127.0.0.1:6443 -p "8080:80@loadbalancer"
kubectl config view --minify | grep server   # must be https://127.0.0.1:6443
kubectl get nodes
```

`--api-port` pins the API server to the address `drill` accepts. `-p` sends `localhost:8080` to Traefik, so you can curl your Ingresses. Stop the cluster with `k3d cluster stop ckad` when you're done, and start it again with `k3d cluster start ckad`. Delete and recreate it if it gets into a bad state.

## Check NetworkPolicy enforcement

Run this once on a new k3s or k3d cluster. The second `wget` must time out.

```bash
kubectl create ns np-test
kubectl -n np-test run web --image=nginx:1.27 --labels=app=web --expose --port=80
kubectl -n np-test wait --for=condition=Ready pod/web
kubectl -n np-test run t --rm -it --image=busybox --restart=Never -- wget -qO- -T 2 web   # works
kubectl -n np-test apply -f - <<'EOF'
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: {name: deny-all}
spec: {podSelector: {}, policyTypes: [Ingress]}
EOF
kubectl -n np-test run t --rm -it --image=busybox --restart=Never -- wget -qO- -T 2 web   # times out
kubectl delete ns np-test
```
