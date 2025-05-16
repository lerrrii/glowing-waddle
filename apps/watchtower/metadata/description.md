# Watchtower Auto-Updater

Watchtower is a Docker container that automatically monitors and updates your running containers whenever their images change. Integrate it with Runtipi to keep all Runtipi-managed services (and any other labeled containers) up to date automatically.

## Features

- **Automated image monitoring**: Polls registries for new image digests.  
- **Selective updates**: Only updates containers labeled with your selector (default `runtipi.managed=true`).  
- **Scheduled checks**: Cron-style scheduling via `--schedule`.  
- **Time-zone support**: Logs and cron scheduling respect your `TZ` choice.  
- **Notifications**: Send updates via email, Slack, MS Teams or Gotify.  
- **Cleanup**: Optionally removes old images via `--cleanup`.  
- **Rollback**: Optionally roll back on failure via `--rollback-on-update-error`.  
- **Extra flags**: Pass any other Watchtower CLI flags (`--include-stopped`, `--rolling-restart`, etc.).  
- **Built-in UI (optional)**: Expose a minimal HTTP interface on port 8080 to view update history.

## Quickstart

1. Fill in the form fields below (schedule, labels, notifications, timezone).  
2. Runtipi will generate and deploy Watchtower using your settings.  
3. If you enabled **Expose UI**, browse to `https://watchtower.${APP_DOMAIN}` for a simple web dashboard of recent scans/updates.

---

### How Email Notifications Work

Watchtower speaks SMTP directly—no external “email client” is needed. Just provide:

- **From & To** addresses  
- **SMTP server** (host:port)  
- **Username** & **Password**  

It will connect over TLS (if you choose) and send mail each run (or only on changes, per your template).

---

### Built-in UI

If you turn **Expose UI** on, Watchtower spins up a tiny web UI on port 8080. It shows:

- A history of past scans  
- Which containers were updated, skipped or failed  
- Logs for each run  

This is the official Watchtower interface—no extra setup required.

