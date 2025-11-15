#!/bin/sh
set -e

LOCKFILE="package-lock.json"
LOCK_HASH_FILE="node_modules/.package-lock.hash"

if [ ! -d node_modules ]; then
  mkdir -p node_modules
fi

CURRENT_HASH=""
if [ -f "$LOCKFILE" ]; then
  CURRENT_HASH=$(sha256sum "$LOCKFILE" | awk '{print $1}')
fi

NEEDS_INSTALL=false

if [ ! -f "$LOCK_HASH_FILE" ]; then
  NEEDS_INSTALL=true
elif [ -n "$CURRENT_HASH" ] && [ "$CURRENT_HASH" != "$(cat "$LOCK_HASH_FILE")" ]; then
  NEEDS_INSTALL=true
fi

if [ "$NEEDS_INSTALL" = true ]; then
  echo "[entrypoint] Installing npm dependencies inside container..."
  npm install

  if [ -n "$CURRENT_HASH" ]; then
    echo "$CURRENT_HASH" > "$LOCK_HASH_FILE"
  else
    rm -f "$LOCK_HASH_FILE"
  fi
fi

exec "$@"
