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

## Configuration Options (via Runtipi UI)
Each setting below appears when installing or editing Dockcheck. Values map directly to CLI flags in `dockcheck.sh`.

| Field                       | Type     | Description & Example                                         |
|-----------------------------|----------|----------------------------------------------------------------|
| **Timeout per container**   | number   | Registry check timeout in seconds. E.g. **10** → `-t 10`.       |
| **Max async checks**        | number   | Concurrent registry queries (0‑32). E.g. **5** → `-x 5`.        |
| **Progress bar width**      | number   | Width of the CLI progress bar. E.g. **60** → `-b 60`.           |
| **Automatic updates**       | boolean  | Non‑interactive auto‑updates. **On** → `-a`.                     |
| **Check only (Dry run)**    | boolean  | List available updates without pulling. **On** → `-n`.          |
| **Auto‑prune images**       | boolean  | Prune dangling images post‑update. **On** → `-p`.                |
| **Auto‑self‑update**        | boolean  | Self‑update the script before runs. **On** → `-u`.              |
| **Notify on updates**       | boolean  | Send notification when updates found. **On** → `-i`.            |
| **Include stopped**         | boolean  | Also check stopped containers. **On** → `-s`.                   |
| **Only if label exists**    | boolean  | Only update containers marked with a label. **On** → `-l`.       |
| **Force restart stack**     | boolean  | Stop+start full compose stack on update. **On** → `-f`.         |
| **Only specific container** | boolean  | Recreate only the updated container (not full stack). **On** → `-F`. |
| **Monochrome mode**         | boolean  | No color output or bar. **On** → `-m`.                          |
| **Print release URLs**      | boolean  | Show container release URLs. **On** → `-I`.                     |
| **Print Markdown URLs**     | boolean  | Show release URLs in Markdown. **On** → `-M`.                   |
| **Exclude containers**      | text     | Comma‑separated names to skip. E.g. **redis,db** → `-e redis,db`.|
| **Include only label name** | text     | Only containers with this label key. E.g. **auto** → `-l`.       |
| **Additional flags**        | text     | Free‑form extra flags. E.g. **-r** → allow `docker run` images.  |
| **Traefik hostnames**       | text     | Comma‑separated hostnames. E.g. **dock.example.com** sets UI URL.|
