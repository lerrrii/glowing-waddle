# Dockcheck

**Automate Docker image update checks with full control and notifications**

Dockcheck is a lightweight CLI tool—fully integrated into Runtipi—to help you stay on top of Docker image updates safely and automatically. Whether you need non‑interactive bulk pulls, selective updates by label or name, or detailed change notifications, Dockcheck has you covered.

## Key Features

- **Automatic & Interactive Modes**: Choose between fully unattended updates or a guided selection UI.
- **Selective Updates**: Filter containers by name, label, or age (only pull if newer than N days).
- **Parallel Checks**: Speed up registry queries with configurable concurrency (1–32 processes).
- **Comprehensive Notifications**: Plug into email, ntfy, Gotify, Telegram, Discord, Slack, and more via customizable templates.
- **Post‑Update Cleanup**: Auto‑prune dangling images to reclaim space after updates.
- **Self‑Update**: Keep Dockcheck itself fresh by auto‑pulling the latest script before running checks.
- **Traefik Integration**: Expose Dockcheck’s web dashboard using Traefik labels, with easy hostname configuration.

Runs on‑demand or scheduled via Runtipi; requires read access to `/var/run/docker.sock` to inspect and pull images.
