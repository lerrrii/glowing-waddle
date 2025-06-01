# Watchtower Auto-Updater

Watchtower is a Docker container that automatically monitors and updates your running containers whenever their images change. Integrate it with Runtipi to keep all Runtipi-managed services (and any other labeled containers) up to date.

## Features

* **Automated image monitoring**: Polls registries for new image digests.
* **Selective updates**: Only updates containers matching your label selector.
* **Scheduled checks**: Cron-style scheduling via `--schedule`.
* **Time-zone support**: Logs and cron scheduling respect your `TZ` choice.
* **Notifications**: Email, Slack, MS Teams or Gotify.
* **Cleanup**: Remove old images via `--cleanup`.
* **Rollback**: Roll back on failure via `--rollback-on-failure`.
* **Docker Hub Authentication**: Bypass rate limits with Docker Hub credentials.
* **HTTP API**: Trigger updates manually via HTTP endpoints.
* **Extra flags**: Pass any other Watchtower CLI flags (`--include-stopped`, `--rolling-restart`, etc.).

### Advanced Configuration Options

#### Include Restarting Containers (`WATCHTOWER_INCLUDE_RESTARTING`)
* **false** (default): ignore containers that are restarting
* **true**: monitor and update containers even if they're currently restarting

#### Revive Stopped Containers (`WATCHTOWER_REVIVE_STOPPED`)  
* **false** (default): don't start stopped containers
* **true**: automatically start stopped containers when updates are available

#### HTTP API & Metrics (`WATCHTOWER_HTTP_API_METRICS`, `WATCHTOWER_HTTP_API_TOKEN`, `WATCHTOWER_HTTP_API_UPDATE`)
* **HTTP API Metrics**: Enable `/v1/metrics` endpoint for monitoring integration
* **HTTP API Update**: Enable `/v1/update` endpoint for manual updates
* **HTTP API Token**: Optional security token for API access

#### Debug Mode (`WATCHTOWER_DEBUG`)
* **false** (default): standard logging
* **true**: verbose debug output for troubleshooting

#### Target Specific Containers (`WATCHTOWER_WATCH`)
* Comma-separated list of container names to monitor exclusively
* Example: `container1,container2,container3`
* Leave empty to use label-based filtering instead

---

## Configuration Guide

Below is a quick reference for the key environment variables and form fields you'll see in Runtipi's UI.

### Docker Hub Authentication

To bypass Docker Hub rate limits, provide your Docker Hub credentials:

* **DOCKER_HUB_USERNAME**: Your Docker Hub username
* **DOCKER_HUB_PASSWORD**: Your Docker Hub password or access token

**When to use**: Always recommended to avoid hitting Docker Hub's anonymous pull rate limits (100 pulls per 6 hours per IP).

---

### Label Selector (`WATCHTOWER_LABEL_ENABLE`)

Controls which containers Watchtower will watch and update:

* **Empty** (default): no filter, all running containers are monitored.
* **Key only** (e.g. `runtipi.managed`): monitors containers with *any* value set on that label.
* **Key=value** (e.g. `runtipi.managed=true`): monitors only containers whose label matches exactly.

**Example** in your service definitions:

```yaml
labels:
  runtipi.managed: "true"
```

Then set **Label selector** to:

```
runtipi.managed=true
```

---

### Rollback on Failure (`WATCHTOWER_ROLLBACK_ON_FAILURE`)

If an image update fails or the container crashes after updating, Watchtower can automatically roll back to the previous image digest.

* **false** (default): no rollback.
* **true**: enable automatic rollback on update error.

**When to use**: critical services where uptime is paramount, and you want to revert if a new image is broken.

---

### Extra Watchtower Arguments (`WATCHTOWER_EXTRA_ARGS`)

Pass any other CLI flags not exposed directly in the Runtipi form.

Separate multiple flags with spaces.

**Examples**:

* Watch stopped containers as well as running ones:
  ```text
  --include-stopped
  ```
* Perform rolling restarts rather than stopping all at once:
  ```text
  --rolling-restart
  ```
* Customize notifications behavior (send on every run, not just updates):
  ```text
  --notifications-on-update-only=false
  ```

---

### Notifications (`WATCHTOWER_NOTIFICATIONS`, Webhooks & SMTP)

Enable one or more notification channels to report update results.

* **WATCHTOWER\_NOTIFICATIONS**: comma-separated list of channels: `email`, `slack`, `msteams`, `gotify`.

For each channel you include, set the corresponding URL or SMTP variables:

| Channel      | Env var(s)                                                                                                                                                                                                     | Description                                          |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| **Slack**    | `WATCHTOWER_NOTIFICATION_SLACK_HOOK_URL`                                                                                                                                                                       | Your Slack incoming-webhook URL.                     |
| **MS Teams** | `WATCHTOWER_NOTIFICATION_MSTEAMS_HOOK_URL`                                                                                                                                                                     | Your Teams webhook URL.                              |
| **Gotify**   | `WATCHTOWER_NOTIFICATION_GOTIFY_URL`                                                                                                                                                                           | Your Gotify server endpoint.                         |
| **Email**    | `WATCHTOWER_NOTIFICATION_EMAIL_FROM`, `WATCHTOWER_NOTIFICATION_EMAIL_TO`, `WATCHTOWER_NOTIFICATION_EMAIL_SERVER`, `WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER`, `WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD` | SMTP settings. `EMAIL_SERVER` is `host:port` format. |

**Example for Slack + Email**:

```env
WATCHTOWER_NOTIFICATIONS=slack,email
WATCHTOWER_NOTIFICATION_SLACK_HOOK_URL=https://hooks.slack.com/services/…
WATCHTOWER_NOTIFICATION_EMAIL_FROM=watchtower@example.com
WATCHTOWER_NOTIFICATION_EMAIL_TO=ops-team@example.com
WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.example.com:587
WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=user
WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=secret
```

---

## Disabling Containers Explicitly

If you want Watchtower to watch **all containers except** those you explicitly skip, you can use a built‑in disable label.

* **Built‑in disable key**: `com.centurylinklabs.watchtower.enable=false`
* **How to use**: add this label to any service you want Watchtower to ignore.

```yaml
services:
  redis:
    image: redis:latest
    labels:
      runtipi.managed: "true"
      com.centurylinklabs.watchtower.enable: "false"
```

Alternatively, you can define your own disable key via the `--label-disable` flag in **Extra Watchtower args**:

```text
# In the Runtipi UI under "Extra Watchtower args":
--label-disable custom.skip.update
```

Then tag services to skip with your custom key:

```yaml
services:
  old_service:
    labels:
      custom.skip.update: "true"
```

---

## Cron Expression Reference

| Position | Field        | Allowed Values             |
| -------- | ------------ | -------------------------- |
| **1**    | Seconds      | `0–59`                     |
| **2**    | Minutes      | `0–59`                     |
| **3**    | Hours        | `0–23`                     |
| **4**    | Day of Month | `1–31`                     |
| **5**    | Month        | `1–12` or `JAN–DEC`        |
| **6**    | Day of Week  | `0–6` (Sun=0) or `SUN–SAT` |

| Schedule                       | Expression      | Explanation                          |
| ------------------------------ | --------------- | ------------------------------------ |
| **Every minute**               | `0 * * * * *`   | At second 0 of every minute          |
| **Every 5 minutes**            | `0 */5 * * * *` | At second 0, every 5 minutes         |
| **Daily at 3 AM**              | `0 0 3 * * *`   | At 03:00:00 every day                |
| **Every Sunday at midnight**   | `0 0 0 * * 0`   | At 00:00:00 on Sundays               |
| **First of month at 4:30 AM**  | `0 30 4 1 * *`  | At 04:30:00 on day 1 of each month   |
| **Hourly on the quarter-hour** | `0 15 * * * *`  | At second 0, minute 15 of every hour |

---

## Quick Tips

* **Build & Test**: Use [Crontab.guru](https://crontab.guru/) to draft your 6-field expression and verify it runs when you expect.
* **Time Zone**: Set `TZ` so your 03:00 means your local 3 AM, not UTC.
* **No Dual Modes**: Don't combine `--schedule` and `--interval`—Watchtower honors only one.
* **Docker Hub Limits**: Always set Docker Hub credentials to avoid rate limiting issues.

Happy auto-updating! 🚀
