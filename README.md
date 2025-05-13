## Gitea Podman

- Goal: deploy Gitea with PostgreSQL as the DB back end
  - Use *rootless* Podman containers

Once the containers are up, execute this command from the host to edit app.init

```
podman exec -u git -it gitea vi /data/gitea/conf/app.ini
```

and change the service settings

```
[service]
DISABLE_REGISTRATION = true
REQUIRE_SIGNIN_VIEW = true
```
