#!/usr/bin/env bash

# Note: this script is intended to be executed once at the initial setup

set -euxo pipefail

if [ -f .env ]; then
  # Load variables from .env file
  export $(grep -v '^#' .env | xargs)

  podman exec -u git -it \
    -e USERNAME="$GITEA_APIUSER_USERNAME" \
    -e PASSWORD="$GITEA_APIUSER_PASSWORD" \
    -e EMAIL="$GITEA_APIUSER_EMAIL" \
    gitea bash -c '/app/gitea/gitea admin user create --username "$USERNAME" --password "$PASSWORD" --email "$EMAIL"'
fi
