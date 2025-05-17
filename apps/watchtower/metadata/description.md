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

---

### Email Notifications

Watchtower speaks SMTP directly—no external mail client is needed. Provide `from`, `to`, `server`, `port`, `user`, `password`; Watchtower sends mail each run (or only on changes, per your template).

---

## Cron Expression

| Position | Field           | Allowed Values                       |
|----------|-----------------|--------------------------------------|
| **1**    | Seconds         | `0–59`                               |
| **2**    | Minutes         | `0–59`                               |
| **3**    | Hours           | `0–23`                               |
| **4**    | Day of Month    | `1–31`                               |
| **5**    | Month           | `1–12` or `JAN–DEC`                  |
| **6**    | Day of Week     | `0–6` (Sun=0) or `SUN–SAT`           |

| Schedule                        | Expression      | Explanation                                  |
|---------------------------------|-----------------|----------------------------------------------|
| **Every minute**                | `0 * * * * *`   | At second 0 of every minute                 |
| **Every 5 minutes**             | `0 */5 * * * *` | At second 0, every 5 minutes                |
| **Daily at 3 AM**               | `0 0 3 * * *`   | At 03:00:00 every day                       |
| **Every Sunday at midnight**    | `0 0 0 * * 0`   | At 00:00:00 on Sundays                      |
| **First of month at 4:30 AM**   | `0 30 4 1 * *`  | At 04:30:00 on day 1 of each month          |
| **Hourly on the quarter-hour**  | `0 15 * * * *`  | At second 0, minute 15 of every hour        |

---

## Quick Tips

- **Build & Test**: Use [Crontab.guru](https://crontab.guru/) to draft your 6-field expression and verify it runs when you expect.  
- **Time Zone**: Set TZ so your 03:00 means your local 3 AM, not UTC.  
- **No Dual Modes**: Don’t combine `--schedule` and `--interval`—Watchtower honors only one.
