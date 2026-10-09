# CKAD Exam prep

Repo used to prepare for the CKAD certification exam: https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/

Run everything from Git Bash in the repo root, against the local Docker Desktop cluster.

```bash
./drill run diag-01     # tasks one at a time, each timed and auto-checked
./drill mock mock-01    # all tasks at once, 120 minutes, weighted score
./drill stats           # pass rate and time/budget per domain
./drill reset           # delete every drill namespace
```

Each task runs in a fresh namespace named after the task. Results go to `progress/log.csv`.

- `MISSION.md`, `NOTES.md`, `RESOURCES.md`: goals, working notes, and trusted sources.
- `lessons/`, `reference/`: HTML lessons and printable cheat sheets.
- `tasks/<id>/`: `task.md` (domain, budget in minutes, text), optional `setup.sh`, and `check.sh`.
- `sets/*.txt`: task lists for a session or a mock.
