# CKAD resources

## Knowledge

- [CKAD curriculum v1.37 - CNCF](https://github.com/cncf/curriculum)
  The official list of exam competencies and domain weights. Use for: deciding what a task set must cover.
- [CKAD exam page - Linux Foundation](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)
  Duration (2 h), Kubernetes version (v1.37), one free retake, two killer.sh sessions. Use for: exam facts.
- [Important tips: CKA and CKAD - LF docs](https://docs.linuxfoundation.org/tc-docs/certification/tips-cka-and-ckad)
  The exam terminal: 15-20 tasks, `ssh` per task, `k` alias with completion, copy/paste keys. Use for: exam-day setup.
- [Resources allowed during the exam - LF docs](https://docs.linuxfoundation.org/tc-docs/certification/certification-resources-allowed)
  kubernetes.io/docs, kubernetes.io/blog and helm.sh/docs only. Use for: knowing which docs pages to practice finding.
- [kubectl quick reference - kubernetes.io](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
  Alias, completion, and the imperative commands. Use for: speed habits. This is the primary source for lesson 0001.
- [kubernetes.io Tasks section](https://kubernetes.io/docs/tasks/)
  Copy-ready YAML for probes, security contexts, ConfigMaps, and more. Use for: anything `kubectl create` cannot generate.
- [killer.sh CKAD simulator](https://killer.sh/ckad)
  Harder than the real exam. Two sessions come with the exam purchase. Use for: one session about 2 weeks before the exam, one in the last week.
- [Docker Desktop Kubernetes docs](https://docs.docker.com/desktop/use-desktop/kubernetes/)
  kubeadm vs kind provisioners. Use for: setting up a v1.37 cluster on a machine where you have admin rights.
- [Ingress NGINX retirement - Kubernetes blog](https://kubernetes.io/blog/2025/11/11/ingress-Nginx-retirement/)
  ingress-nginx stopped receiving updates in March 2026. Use for: picking a different controller (for example Traefik) if you install one.

## Wisdom (communities)

- [Kubernetes Slack](https://slack.k8s.io/)
  Official community Slack. Use for: questions about exam experience and tricky API behavior.
- [r/kubernetes](https://www.reddit.com/r/kubernetes/)
  Large, active subreddit with frequent CKAD exam reports. Use for: recent exam-day experiences.

## Gaps

- No practice cluster on v1.37 yet. Features added after v1.29 can't be practiced on this machine.
