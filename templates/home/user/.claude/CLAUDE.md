# Global rules

## Writing

- Use plain keyboard characters only, in code, comments, commit messages,
  documents and file names. ASCII only. No em dashes, no en dashes, no curly
  quotes, no arrows, no ellipsis characters, no emoji, no box drawing. Write
  `-`, `"`, `'`, `->`, `...` instead.
- Do not use grammar that marks text as AI written. No comma before "and" or
  "or" in a list (no Oxford comma). No "it's not just X, it's Y". No filler
  praise or padding.

## Design

- Keep everything as simple as possible. Apply KISS and YAGNI.
- Do not overengineer. No abstraction, option, config flag or layer that the
  current task does not need.
- Solve the problem in front of you, not the one that might come later.

## Working style

- Always respect this file and every `CLAUDE.md` from the working directory up
  the tree, whether or not it sits in a git repo. A parent folder that only
  holds repos can carry one, and it then applies to every repo under it. All of
  them apply at all times, in every mode.
- Read the project's own `CLAUDE.md`, `README.md` or specs before changing it.
  Projects differ. Do not carry an assumption from one into another.
- Do only what the task defines. Record out-of-scope observations instead of
  implementing them.
- Keep changes small and reversible.
- Base claims on a fresh read of the source. Re-open the file or re-run the
  check rather than relying on memory or an earlier read, which may be stale.
- Raise concerns during implementation rather than silently agreeing. Push back
  on questionable suggestions.
- Report honestly: if a check fails, show the output; if a step was skipped, say
  so.

## Git

- Do not run git commands that change anything: no add, commit, push, merge,
  rebase, checkout, branch, stash, reset, tag. That is the user's job.
- Commit and push are done by the user in another shell.
- Stop after each atomic change, auto mode included. When the change is in a git
  repo, give a commit message for it, then wait for the user to commit before
  going on. Do not batch several changes into one turn.
- Reading is fine: status, diff, log, show, blame.

## Running the application

- The development environment runs on a separate VM. Its shell is not reachable
  from here, so you cannot run commands, start services or deploy there. The
  user transfers updated code to that VM manually and tests it there.
- The running web application is reachable in the browser. Open it when you need
  to look at actual behaviour.
- Static checks, builds, linters and unit tests that run locally are fine.
- When something has to be run on the VM, say what to run and leave it to the
  user.

## Temporary files

- Put every script or file you create that is not part of the project itself
  under `~/claude-tmp`.
- Create one subfolder per context, named after the task, for example
  `~/claude-tmp/video-slow-loading/`.
- Never scatter scratch files into the project folders.
