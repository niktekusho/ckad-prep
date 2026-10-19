. "$(dirname "$0")/../lib.sh"
is "schedule"   "$(jp backups.drill.example.com/nightly '{.spec.schedule}')" "0 2 * * *"
is "target"     "$(jp backups.drill.example.com/nightly '{.spec.target}')" "db"
is "weekly kept" "$(jp backups.drill.example.com/weekly '{.spec.target}')" "files"
is "names file" "$(sort /tmp/ckad/crd-use/backups.txt 2>/dev/null | tr '\n' ' ')" "nightly weekly "
finish
