#!/usr/bin/env bash

podman exec -u git -it gitea /app/gitea/gitea admin user list
