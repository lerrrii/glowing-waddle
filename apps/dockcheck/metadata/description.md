# Dockcheck

**Automate Docker image update checks**

Dockcheck is a lightweight utility to automate Docker image update checks and optionally pull newer versions. This Runtipi integration wraps Dockcheck with a user-friendly dashboard for configuring its core behavior.

Runs on-demand or via scheduler. Requires read-only access to `/var/run/docker.sock`.

---

## Key Features

* **Automatic Updates** (`AUTO_MODE`): Enable background bulk image pulls.
* **Parallel Checks** (`MAX_ASYNC`): Increase speed by checking multiple images simultaneously.
* **Age Filtering** (`DAYS_OLD`): Skip recently updated images.
* **Container Exclusion** (`EXCLUDE_CONTAINERS`): Prevent updates to sensitive containers.
* **Label-based Filtering** (`ONLY_LABEL`): Only update containers with a specific Docker label.
* **Auto-Pruning** (`AUTO_PRUNE`): Remove unused images after updates.
* **Extra Flags** (`EXTRA_FLAGS`): Inject advanced Dockcheck arguments.
* **Traefik Hostnames** (`TRAEFIK_HOSTS`): Route dashboard traffic through Traefik.

---

## Settings, Defaults & Examples

### Variables & Defaults

| Setting                   | Variable             | Default   |
| ------------------------- | -------------------- | --------- |
| **Automatic updates**     | `AUTO_MODE`          | `false`   |
| **Max parallel checks**   | `MAX_ASYNC`          | `1`       |
| **Min image age (days)**  | `DAYS_OLD`           | `0`       |
| **Exclude containers**    | `EXCLUDE_CONTAINERS` | *(empty)* |
| **Only update if label**  | `ONLY_LABEL`         | *(empty)* |
| **Auto-prune images**     | `AUTO_PRUNE`         | `false`   |
| **Extra dockcheck flags** | `EXTRA_FLAGS`        | *(empty)* |
| **Traefik hostnames**     | `TRAEFIK_HOSTS`      | *(empty)* |

---

### Examples & Descriptions

| Setting                   | Example                  | Description                                                                                       |
| ------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------- |
| **Automatic updates**     | `true` or `false`        | `true` to automatically update all eligible containers; `false` runs in audit mode only.          |
| **Max parallel checks**   | `1`–`32`                 | Number of concurrent image checks. Increase for large hosts; default `1` conserves resources.     |
| **Min image age (days)**  | `0`, `3`, `7`, etc.      | Skip images younger than this many days. Prevents updating freshly deployed images.               |
| **Exclude containers**    | `nginx,db,portainer`     | Comma-separated list of container names to skip. Default empty (no exclusions).                   |
| **Only update if label**  | `autoupdate`             | Only update containers with this label. Default empty (disable label filter).                     |
| **Auto-prune images**     | `true` or `false`        | `true` removes dangling images post-update; `false` leaves them for manual inspection.            |
| **Extra dockcheck flags** | `--dry-run`, `--retry 2` | Additional CLI flags for `dockcheck.sh`. Default empty (no extras).                               |
| **Traefik hostnames**     | `dockcheck.mydomain.com` | Comma-separated domains for Traefik routing. Default empty—dashboard won’t be exposed unless set. |
