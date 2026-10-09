for a in db api other; do kubectl -n "$NS" run "$a" --image=nginx:1.27 --labels="app=$a"; done
