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
| **Include stopped**         | boolean  | Also check stopped containers (docker ps -a). **On** → `-s`.   |
| **Only if label exists**    | boolean  | Only update containers marked with a label. **On** → `-l`.       |
| **Force restart stack**     | boolean  | Stop+start full compose stack on update. **On** → `-f`.         |
| **Only specific container** | boolean  | Recreate only the updated container (not full stack). **On** → `-F`. |
| **Monochrome mode**         | boolean  | No color output or bar. **On** → `-m`.                          |
| **Print release URLs**      | boolean  | Show container release URLs. **On** → `-I`.                     |
| **Print Markdown URLs**     | boolean  | Show release URLs in Markdown. **On** → `-M`.                   |
| **Exclude containers**      | text     | Comma‑separated names to skip. E.g. **redis,db** → `-e redis,db`.|
| **Include only label name** | text     | Only containers with this label key. E.g. **auto** → `-l`.       |
| **Additional flags**        | text     | Any extra `dockcheck.sh` flags. E.g. **-r** → include `docker run` containers (images from standalone containers).  |
| **Traefik hostnames**       | text     | Comma‑separated hostnames for UI. E.g. **dock.example.com** sets the HTTP host rule for Traefik labels.|

---

## FAQ & Advanced Setup

### How do notifications work?  
Dockcheck invokes your custom `notify.sh` template when `-i` is set. Runtipi does **not** configure the email client for you—you must place and configure a `notify.sh` script (from `notify_templates/`) alongside your `dockcheck.sh`.  That script handles sending via SMTP, ntfy, Gotify, Telegram, Discord, Slack, etc., based on your template settings.

### What does "Include stopped containers" check?  
When enabled, Dockcheck runs `docker ps -a` (not just `docker ps`), so it will list and update containers regardless of their running state. Runtipi’s dashboard stopped/running UI state does not affect this: it uses the underlying Docker API.

### What are "Additional flags" for?  
Use this free-form field to pass any valid `dockcheck.sh` flags Runtipi doesn’t expose individually. For example, `-r` checks and updates images for containers started with plain `docker run`, or `-F` to only recreate the specific container instead of the full stack.

### How do Traefik hostnames work?  
This sets the `Host(...)` rule in the Traefik labels, binding your chosen domain(s) to Dockcheck’s UI. Enter one or more hostnames (comma‑separated) and Runtipi will replace `{{TRAEFIK_HOSTS}}` in the label rule automatically.

---

## Prerequisites & Setup Steps

Before using Dockcheck in Runtipi, ensure the following are in place:

1. **`notify.sh` Template**: Copy and customize a notification template from the `notify_templates/` directory into the same folder as `dockcheck.sh`. Confirm it’s executable and correctly configured (SMTP credentials, webhook URLs, etc.).
2. **Docker Permissions**: Runtipi must run with permission to read and create containers—ensure the service account has access to `/var/run/docker.sock`.
3. **Auxiliary Binaries**: Dockcheck may prompt to install or download `jq`, `regctl` (or `regclient`), and `curl` at startup. Verify your Alpine image or base container includes these, or that internet access is available to fetch them.
4. **Optional Plugins**: For advanced metrics or integrations (Prometheus export, Zabbix, Synology DSM), follow Dockcheck’s own README to provide the required directory paths (e.g., `-c /path/to/textfile-collector`).
5. **Testing**: After installing, run a manual check via the Runtipi CLI (`tipi exec dockcheck -- -n`) to confirm flags and notifications work before scheduling.
