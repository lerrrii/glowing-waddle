# Watchtower Auto-Updater

Watchtower is a Docker container that automatically monitors and updates your running containers whenever their images change. Integrate it with Runtipi to keep all Runtipi-managed services (and any other labeled containers) up to date automatically.

## Features

- **Automated image monitoring**: Polls registries for new image digests.
- **Selective updates**: Only updates containers labeled `runtipi.managed=true` or custom labels.
- **Scheduled checks**: Cron-style scheduling via `--schedule`.
- **Cleanup**: Optionally removes old images via `--cleanup`.
- **Rollback**: Optionally roll back on failure via `--rollback-on-update-error`.
- **Built‑in UI (optional)**: Expose a minimal HTTP interface on port 8080 to view update history.