#!/bin/sh
# Symlink every script in bin/ into ~/.local/bin (or $1). Safe to re-run.
set -eu
src="$(cd "$(dirname "$0")" && pwd)/bin"
dest="${1:-$HOME/.local/bin}"
mkdir -p "$dest"
for f in "$src"/*; do
  [ -f "$f" ] && [ -x "$f" ] || continue
  name=${f##*/}
  if [ -e "$dest/$name" ] && [ ! -L "$dest/$name" ]; then
    echo "skip $name: $dest/$name exists and is not a symlink" >&2; continue
  fi
  ln -sfn "$f" "$dest/$name" && echo "linked $name"
done
case ":$PATH:" in *":$dest:"*) ;; *) echo "note: add $dest to PATH" >&2 ;; esac
