# CKAD Exam prep

Repo used to prepare for the CKAD certification exam: https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/

Run everything from a Linux or macOS shell in the repo root, against a local cluster set up as in [docs/setup.md](docs/setup.md). `drill` deletes namespaces, so it refuses to run against anything else.

```bash
./drill                # what to do next
./drill run diag-01     # tasks one at a time, each timed and auto-checked
./drill mock mock-01    # all tasks at once, 120 minutes, weighted score
./drill stats           # pass rate and time/budget per domain
./drill clean           # delete every drill namespace and ~/ckad task folder
```

Each task runs in a fresh namespace named after the task. Keep your YAML in `workdir/`, which git ignores, so your solutions stay out of the repo. `run` and `mock` empty it first, so no old solution carries over. Results go to `progress/log.csv`. A drill never cleans up on its own: when `run` or `mock` ends, it asks whether to delete its resources (default no), and `./drill clean` does it any time later.

## A weekday session (about 1 hour)

Run `./drill` in the repo root. It reads your progress and prints the one step to do next: ask Claude for the next session (`/mattpocock-skills:teach next session`), read the lesson, run the set, or tell Claude you are done so the failed tasks get reviewed. On a weekend it points to the pending mock instead (120 minutes, written by Claude the day before). Work only with `kubectl`, `nano` and kubernetes.io/docs, as in the exam.

- `MISSION.md`, `NOTES.md`, `RESOURCES.md`: goals, working notes, and trusted sources.
- `docs/setup.md`: practice cluster setup for each machine.
- `lessons/`, `reference/`: HTML lessons and printable cheat sheets.
- `tasks/<id>/`: `task.md` (domain, budget in minutes, text), optional `setup.sh`, and `check.sh`.
- `sets/*.txt`: task lists for a session or a mock.
- `charts/`: local Helm charts that tasks install, so Helm tasks work offline.
