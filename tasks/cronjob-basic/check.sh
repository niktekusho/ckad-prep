. "$(dirname "$0")/../lib.sh"
is  "schedule"            "$(jp cj/backup '{.spec.schedule}')" "*/15 * * * *"
is  "image"               "$(jp cj/backup '{.spec.jobTemplate.spec.template.spec.containers[0].image}')" "busybox:1.36"
has "runs date"           "$(jp cj/backup '{.spec.jobTemplate.spec.template.spec.containers[0].command}{.spec.jobTemplate.spec.template.spec.containers[0].args}')" "date"
is  "no overlapping Jobs" "$(jp cj/backup '{.spec.concurrencyPolicy}')" "Forbid"
is  "successful history"  "$(jp cj/backup '{.spec.successfulJobsHistoryLimit}')" "2"
finish
