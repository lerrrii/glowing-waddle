# Watchtower Auto-Updater

Watchtower automatically detects when Docker images (including `:latest`) have been updated in their registries and gracefully pulls & restarts the corresponding containers.

## Features

- **Digest-based polling**: Only restarts containers when the image digest changes, avoiding needless restarts.
- **Cron-style schedule**: Customize update frequency.
- **Label filtering**: Only monitors containers labeled `runtipi.managed=true` (and `com.centurylinklabs.watchtower.enable=true`).
- **Cleanup**: Optionally remove old images after updates.
- **Optional UI**: Expose Watchtower’s built-in web UI at `watchtower.<your-domain>`.

## Usage

1. Configure update schedule, cleanup, and UI exposure options in Runtipi’s form.
2. Install and start the Watchtower app.
3. All Runtipi-managed containers will be kept up to date automatic
4. ally.
