# toolbox

Personal scripts shared across machines.

```
toolbox/
├── bin/          # executables, no extension; each is linked onto PATH
├── lib/          # shared shell helpers sourced by bin/ scripts
├── install.sh    # links bin/* into ~/.local/bin (idempotent)
└── README.md
```

Conventions:
- One tool = one file in `bin/`, with a `--help` header comment.
- Never hardcode machine-specific paths (`/opt/homebrew/...`); resolve via `PATH`/`command -v`.
- Machine-local overrides go in env vars, not in the repo.

Setup on a new machine:

```sh
git clone <repo> ~/toolbox && ~/toolbox/install.sh
```

## Tools

### codex-ws

Run codex with a separate session directory per app.

```sh
codex-ws orca --dangerously-bypass-approvals-and-sandbox --no-alt-screen   # ~/.codex-orca
codex-ws work resume                                                       # ~/.codex-work
codex-ws /path/to/home exec "..."                                         # explicit path
codex-ws --list
```

On first use of a name it copies `auth.json`/`config.toml` from `~/.codex`.
