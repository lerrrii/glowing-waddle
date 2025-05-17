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

## Settings and Examples

These variables are exposed in the Runtipi dashboard for easy adjustment.

| Setting                              | Variable             | Example                  | Description                                                                                                                                  |
| ------------------------------------ | -------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| **Automatic updates**                | `AUTO_MODE`          | `true` or `false`        | Set `true` to automatically update all eligible containers during execution. Use `false` to simulate or audit updates without applying them. |
| **Max parallel checks**              | `MAX_ASYNC`          | `1` to `32`              | Set to the number of container image checks to run in parallel. More than 4 is useful for large Docker hosts.                                |
| **Min image age (days)**             | `DAYS_OLD`           | `0`, `3`, `7`, etc.      | Skip updating containers if the image was pulled less than this many days ago. Helps prevent flapping after recent deployments.              |
| **Exclude containers**               | `EXCLUDE_CONTAINERS` | `nginx,db,portainer`     | Comma-separated container names to exclude from update checks. Prevents critical or special containers from being updated.                   |
| **Only update if label present**     | `ONLY_LABEL`         | `autoupdate`             | Only update containers with a specific label, like `autoupdate=true`. Leave blank to disable this filter.                                    |
| **Auto-prune images**                | `AUTO_PRUNE`         | `true` or `false`        | If `true`, unused (dangling) Docker images will be removed automatically post-update. Saves disk space.                                      |
| **Extra dockcheck flags (optional)** | `EXTRA_FLAGS`        | `--dry-run`, `--retry 2` | Insert advanced CLI options for Dockcheck, such as enabling dry runs or setting retry counts.                                                |
| **Traefik hostnames**                | `TRAEFIK_HOSTS`      | `dockcheck.mydomain.com` | Comma-separated list of domains to serve the Dockcheck dashboard via Traefik. Must be configured in your DNS.                                |

---

## Corrections Needed

Yes, there was one small issue in the `docker-compose.yml`:

* **Text environment defaults were using escape characters improperly.** For text variables like `EXCLUDE_CONTAINERS`, use this syntax:

  ```yaml
  EXCLUDE_CONTAINERS: "${EXCLUDE_CONTAINERS-}"
  ONLY_LABEL: "${ONLY_LABEL-}"
  EXTRA_FLAGS: "${EXTRA_FLAGS-}"
  ```

  This avoids injecting empty strings with extra characters (`\"`) that could interfere with `dockcheck.sh` parsing.

Update your compose file if you had used `"${EXCLUDE_CONTAINERS-}\""` or similar.

---

## How it Works in Runtipi

* The `config.json` defines the available settings in the Runtipi app dashboard.
* The `docker-compose.json` and `.yml` define the container and how flags are constructed.
* At runtime, `dockcheck.sh` is fetched and executed inside a minimal Alpine container.
* Flags are dynamically constructed from environment variables.
* All key settings are configurable without editing the script or compose file.

---

With these settings and corrections, Dockcheck is fully compatible with Runtipi and ready for both casual users and advanced automation workflows.

For more details, see: [Dockcheck GitHub](https://github.com/mag37/dockcheck)
