# Dockcheck

**Automate Docker image update checks**

A streamlined Runtipi integration for Dockcheck that exposes only core, user-friendly options directly in the dashboard.

Key features supported:

- **Automatic updates**: Toggle non-interactive bulk pulls
- **Selective filtering**: Exclude containers or update only by label
- **Concurrency control**: Set number of parallel registry checks
- **Old-image protection**: Skip images younger than N days
- **Auto-prune**: Remove dangling images after updates

Runs on-demand or via scheduler; requires read access to `/var/run/docker.sock`.
