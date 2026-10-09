# Sourced by every check.sh. NS is the task namespace.
export MSYS_NO_PATHCONV=1
fail=0
kc() { kubectl -n "$NS" "$@" 2>/dev/null | tr -d '\r'; }
jp() { kc get "$1" -o jsonpath="$2"; }
is() { if [ "$2" = "$3" ]; then echo "  ok    $1"; else echo "  FAIL  $1 (found: '$2')"; fail=1; fi; }
has() { case "$2" in *"$3"*) echo "  ok    $1" ;; *) echo "  FAIL  $1 (found: '$2')"; fail=1 ;; esac; }
finish() { exit $fail; }
