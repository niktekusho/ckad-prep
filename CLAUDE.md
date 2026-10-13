# CLAUDE.md

## Viewing HTML pages
Show the pages in `lessons/` and `reference/` through a local server, never as files. Opened as a file, a page can't load `assets/style.css` or `assets/quiz.js`, so it renders unstyled and the quizzes don't work.

Start the `lessons` server from `.claude/launch.json` (`npx --yes serve@14.2.6 -l tcp://127.0.0.1:8000` in the repo root, needs only Node), then open the page by path, for example `http://localhost:8000/lessons/0002-networkpolicy-from-zero.html`.
