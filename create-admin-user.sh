#!/usr/bin/env bash

# Note: this script is intended to be executed once at the initial setup

set -euxo pipefail

if [ -f .env ]; then
  # Load variables from .env file
  export $(grep -v '^#' .env | xargs)

  # Execute command with env vars
  podman exec -u git -it \
    -e USERNAME="$GITEA_ADMIN_USERNAME" \
    -e PASSWORD="$GITEA_ADMIN_PASSWORD" \
    -e EMAIL="$GITEA_ADMIN_EMAIL" \
    gitea bash -c '/app/gitea/gitea admin user create --username "$USERNAME" --password "$PASSWORD" --email "$EMAIL" --admin'
fi
