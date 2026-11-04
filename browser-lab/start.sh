#!/usr/bin/env bash
set -euo pipefail

# Only publish the HTTP desktop on loopback. Codespaces supplies HTTPS and login.
name=home-wifi-browser-lab
if docker container inspect "$name" >/dev/null 2>&1; then
  docker start "$name"
else
  docker run --detach --name "$name" --shm-size=1g \
    --publish 127.0.0.1:3000:3000 \
    lscr.io/linuxserver/chromium:latest
fi
echo "Open private port 3000 from the Codespaces Ports panel."
