# Docker Adminer with env login

[Adminer](https://www.adminer.org) docker image with extended env variables for autologin. Supports Docker Swarm Secrets.

Docker hub: http://hub.docker.com/r/butopea/adminer

## Exapmle:
```yaml
version: '3.8'

services:
    adminer:
        image: butopea/adminer
        ports:
            - 8080:8080
        environment:
            ADMINER_DB: adminer
            ADMINER_DRIVER: pgsql
            ADMINER_PASSWORD: adminer
            # OR #
            ADMINER_PASSWORD_FILE: /run/secrets/password_file
            ADMINER_SERVER: postgres
            ADMINER_USERNAME: adminer
            ADMINER_AUTOLOGIN: 1
            ADMINER_NAME: This will be in the title!


    postgres:
        image: postgres:11-alpine
        restart: on-failure
        environment:
            POSTGRES_DB: adminer
            POSTGRES_USER: adminer
            POSTGRES_PASSWORD: adminer
            # OR #
            POSTGRES_PASSWORD_FILE: /run/secrets/password_file


```

## Tags

```
butopea/adminer:4.8.1-en_v1
```

- `4.8.1` = Adminer version
- `en` = Adminer flavour (as in https://github.com/vrana/adminer/releases)
- `v1` = Image version, when something else than adminer version in this repository changes 

## Environment Variables

### `ADMINER_DB, ADMINER_PASSWORD, ADMINER_PASSWORD_FILE, ADMINER_SERVER, ADMINER_USERNAME`

### `ADMINER_PASSWORD_FILE`

If provided, script tries read content of file and uses it as password. Overwrites `ADMIN_PASSWORD`. Useful if using Docker Swarm Secrets

### `ADMINER_DRIVER`
Value from driver select

Current possible values are:
- `sqlite`
- `sqlite2`
- `pgsql`
- `oracle`
- `mssql`
- `firebird`
- `simpledb`
- `mongo`
- `elastic`
- `clickhouse`

(This image was not tested with all of them)

### `ADMINER_AUTOLOGIN`
If this variable exists (even if it's empty), adminer will try to autologin, no matter if all fields are filled

### `ADMINER_NAME`
This value will be in the title and heading.
