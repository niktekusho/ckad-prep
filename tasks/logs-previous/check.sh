. "$(dirname "$0")/../lib.sh"
want=$(jp pod/flaky '{.spec.containers[0].command}' | grep -o 'FATAL: lost connection, code [0-9]*')
is "error line saved" "$(cat /tmp/ckad/flaky.txt 2>/dev/null)" "${want:-missing}"
finish
