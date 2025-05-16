# Watchtower Auto-Updater

Watchtower is a Docker container that automatically monitors and updates your running containers whenever their images change. Integrate it with Runtipi to keep all Runtipi-managed services (and any other labeled containers) up to date.

## Features

- **Automated image monitoring**: Polls registries for new image digests.  
- **Selective updates**: Only updates containers matching your label selector.  
- **Scheduled checks**: Cron-style scheduling via `--schedule`.  
- **Time-zone support**: Logs and cron scheduling respect your `TZ` choice.  
- **Notifications**: Email, Slack, MS Teams or Gotify.  
- **Cleanup**: Remove old images via `--cleanup`.  
- **Rollback**: Roll back on failure via `--rollback-on-update-error`.  
- **Extra flags**: Pass any other Watchtower CLI flags (`--include-stopped`, `--rolling-restart`, etc.).  
- **Built-in UI (optional)**: Minimal web dashboard on port 8080 for history & logs.

---

### Email Notifications

Watchtower speaks SMTP directly—no external mail client is needed. Provide `from`, `to`, `server`, `port`, `user`, `password`; Watchtower sends mail each run (or only on changes, per your template).

### Built-in UI

Enable `WATCHTOWER_UI` to expose a tiny HTTP interface on port 8080 showing:

- History of past scans  
- Which containers were updated/skipped/failed  
- Logs per run  

Reverse-proxy it with your existing Traefik setup—no extra service required.
