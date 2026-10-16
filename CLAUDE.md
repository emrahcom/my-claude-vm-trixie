# my-claude-vm-trixie

Rules for changing `claude-vm-installer`.

- Every step must be safe to rerun and must not break an installed system.
  Skip what already exists, overwrite only files the installer owns.
- Do not manage host config such as `/etc/apt/apt.conf.d/` or VM guest tools.
  That is the user's business.
- Install packages with `apt-get-norec`, or `apt-get-rec` only if
  recommends are really needed. Use plain `apt-get` for everything else.
- Config files live in `templates/`, mirroring their target path. User
  files go in `templates/home/user/` and are copied only if missing. No
  secrets and no user name in templates.
- Rules that must always apply go in `templates/home/user/.claude/CLAUDE.md`.
  Only a multi-step procedure that is needed now and then becomes a skill in
  `templates/home/user/.claude/skills/<name>/SKILL.md`.
- Optional tools get an `INSTALL_` flag in globals, overridable from the
  environment. Keep the flags in alphabetical order.
- Avoid things that need regular maintenance, such as pinned key
  fingerprints.
- Commit messages are one sentence, no trailer.
- Check changes with `bash -n` and `shellcheck` before handing them over.
