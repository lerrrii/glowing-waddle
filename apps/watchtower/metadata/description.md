# Watchtower Auto-Updater

Watchtower is a Docker container that automatically monitors and updates your running containers whenever their images change. Integrate it with Runtipi to keep all Runtipi-managed services (and any other labeled containers) up to date.

## Features

* **Automated image monitoring**: Polls registries for new image digests.
* **Selective updates**: Only updates containers matching your label selector.
* **Scheduled checks**: Cron-style scheduling via `--schedule`.
* **Time-zone support**: Logs and cron scheduling respect your `TZ` choice.
* **Notifications**: Email, Slack, MS Teams or Gotify.
* **Cleanup**: Remove old images via `--cleanup`.
* **Docker Hub Authentication**: Bypass rate limits with Docker Hub credentials.
* **HTTP API**: Trigger updates manually via HTTP endpoints.
* **Extra flags**: Pass any other Watchtower CLI flags (`--include-stopped`, `--rolling-restart`, etc.).

### Advanced Configuration Options

#### Include Restarting Containers (`WATCHTOWER_INCLUDE_RESTARTING`)
* **false** (default): ignore containers that are restarting
* **true**: monitor and update containers even if they're currently restarting

#### Include Stopped Containers (`WATCHTOWER_INCLUDE_STOPPED`)
* **false** (default): don't monitor stopped containers
* **true**: also monitor created and exited containers

#### Revive Stopped Containers (`WATCHTOWER_REVIVE_STOPPED`)  
* **false** (default): don't start stopped containers
* **true**: automatically start stopped containers when updates are available (requires `WATCHTOWER_INCLUDE_STOPPED=true`)

#### HTTP API & Metrics (`WATCHTOWER_HTTP_API_METRICS`, `WATCHTOWER_HTTP_API_TOKEN`, `WATCHTOWER_HTTP_API_UPDATE`)
* **HTTP API Update**: Enable `/v1/update` endpoint for manual updates
* **HTTP API Metrics**: Enable `/v1/metrics` endpoint for monitoring integration
* **HTTP API Token**: Optional security token for API access
* **HTTP API Periodic Polls**: Keep running periodic updates even when HTTP API is enabled

#### Debug Mode (`WATCHTOWER_DEBUG`, `WATCHTOWER_LOG_LEVEL`, `WATCHTOWER_TRACE`)
* **WATCHTOWER_DEBUG**: Enable/disable debug mode
* **WATCHTOWER_LOG_LEVEL**: Set logging verbosity (panic, fatal, error, warn, info, debug, trace)
* **WATCHTOWER_TRACE**: Enable trace mode for maximum verbosity (WARNING: exposes credentials in logs)

#### Monitor Only Mode (`WATCHTOWER_MONITOR_ONLY`)
* **false** (default): update containers when new images are found
* **true**: only monitor and notify, don't actually update containers

---

## Configuration Guide

Below is a quick reference for the key environment variables and form fields you'll see in Runtipi's UI.

### Docker Hub Authentication

To bypass Docker Hub rate limits, provide your Docker Hub credentials:

* **REPO_USER**: Your Docker Hub username
* **REPO_PASS**: Your Docker Hub password or access token

**When to use**: Always recommended to avoid hitting Docker Hub's anonymous pull rate limits (100 pulls per 6 hours per IP).

---

### Label Selector (`WATCHTOWER_LABEL_ENABLE`)

Controls which containers Watchtower will watch and update:

* **false** (default): no label filtering, monitors containers based on other criteria
* **true**: only monitors containers with `com.centurylinklabs.watchtower.enable=true` label

**Example** in your service definitions:

```yaml
labels:
  com.centurylinklabs.watchtower.enable: "true"
  runtipi.managed: "true"
```

Then set **Label Enable** to `true`.

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
* Only monitor specific containers by name:
  ```text
  nginx redis postgres
  ```
* Use a custom label for filtering:
  ```text
  --label-enable com.example.watchtower=true
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
* **No Rollback**: Watchtower doesn't have rollback functionality - test updates carefully!
* **Debug Logging**: Use trace mode only temporarily as it exposes credentials in logs.

Happy auto-updating! 🚀
