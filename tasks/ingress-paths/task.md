domain: networking
budget: 6
---
Services `web-svc` and `api-svc` exist (port 80). Create Ingress `shop-ing` for host `shop.local`:
- path `/api` (prefix match) goes to `api-svc` port 80
- path `/` (prefix match) goes to `web-svc` port 80
