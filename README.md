# CKAD Exam prep

Repo used to prepare for the CKAD certification exam: https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/

Run everything from a Linux or macOS shell in the repo root, against a local cluster set up as in [docs/setup.md](docs/setup.md). `drill` deletes namespaces, so it refuses to run against anything else.

```bash
./drill run diag-01     # tasks one at a time, each timed and auto-checked
./drill mock mock-01    # all tasks at once, 120 minutes, weighted score
./drill stats           # pass rate and time/budget per domain
./drill reset           # delete every drill namespace
```

Each task runs in a fresh namespace named after the task. Results go to `progress/log.csv`.

## A weekday session (about 1 hour)

1. Ask Claude for the next session (`/teach next session`). Claude reads `./drill stats` and writes the next `sets/*.txt`. If a gap needs explaining, Claude also writes a short lesson in `lessons/`.
2. Read the lesson, if there is one (10 minutes at most).
3. Run the set: `./drill run <set>`. Work only with `kubectl`, `vim` and kubernetes.io/docs, as in the exam.
4. Tell Claude you are done. You go through the failed and skipped tasks together, and Claude records what you learned in `learning-records/`.

On Saturday, run the week's mock instead: `./drill mock mock-0N` (120 minutes). Claude writes that set the day before.

- `MISSION.md`, `NOTES.md`, `RESOURCES.md`: goals, working notes, and trusted sources.
- `docs/setup.md`: practice cluster setup for each machine.
- `lessons/`, `reference/`: HTML lessons and printable cheat sheets.
- `tasks/<id>/`: `task.md` (domain, budget in minutes, text), optional `setup.sh`, and `check.sh`.
- `sets/*.txt`: task lists for a session or a mock.
