. "$(dirname "$0")/../lib.sh"
is "completions 6"  "$(jp job/batch '{.spec.completions}')" "6"
is "parallelism 2"  "$(jp job/batch '{.spec.parallelism}')" "2"
is "backoffLimit 2" "$(jp job/batch '{.spec.backoffLimit}')" "2"
is "6 succeeded"    "$(jp job/batch '{.status.succeeded}')" "6"
finish
