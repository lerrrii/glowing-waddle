# Backrest

Backrest is a web-accessible backup solution built on top of restic. Backrest provides a WebUI which wraps the restic CLI and makes it easy to create repos, browse snapshots, and restore files. Additionally, Backrest can run in the background and take an opinionated approach to scheduling snapshots and orchestrating repo health operations.

## Features
* Web Interface: Access locally or remotely (perfect for NAS deployments)
* Multi-Platform Support: Linux, macOS, Windows, FreeBSD, Docker
* Backup Management:
  - Import existing restic repositories
  - Cron-scheduled backups and maintenance (e.g. prune, check, forget, etc)
  - Browse and restore files from snapshots
  - Configurable notifications (Discord, Slack, Shoutrrr, Gotify, Healthchecks)
  - Pre/post backup command hooks to execute shell scripts
* Storage Options:
  - Compatible with rclone remotes
  - Supports all restic storage backends (S3, B2, Azure, GCS, local, SFTP, and all rclone remotes)

## Why Use Backrest?
By building on restic, Backrest leverages its mature, fast, reliable, and secure backup capabilities while adding an intuitive interface. Built with Go, Backrest is distributed as a standalone, lightweight binary with restic as its sole dependency.

## Key Benefits
- **Easy Management**: WebUI handles most operations while still allowing direct access to restic CLI
- **Flexible Storage**: Works with local storage or any cloud provider supported by restic
- **Automated Scheduling**: Set up automated backups and maintenance tasks
- **Notification Support**: Get alerts via multiple channels when backups complete or fail
- **Secure**: Built on restic's proven encryption and deduplication technology

## Configuration
The default port is 9898. First-time setup will prompt for username and password creation.

## Storage Configuration
Mount your data to backup at `/userdata` and optionally mount local repository storage at `/repos` if not using remote storage.

## Documentation
For detailed configuration and usage instructions, please refer to:
- Backrest documentation: https://github.com/garethgeorge/backrest
- Restic documentation: https://restic.readthedocs.io/

## Folder Information
| Root Folder | Container Folder | Purpose |
|-------------|------------------|---------|
| /runtipi/app-data/backrest/data/data | /data | Application data |
| /runtipi/app-data/backrest/data/config | /config | Configuration files |
| /runtipi/app-data/backrest/data/cache | /cache | Cache directory |
| /runtipi/app-data/backrest/data/tmp | /tmp | Temporary files |
| /runtipi/app-data/backrest/data/userdata | /userdata | Data to backup |
| /runtipi/app-data/backrest/data/repos | /repos | Local repositories (optional) |