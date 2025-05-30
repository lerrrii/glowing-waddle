# Kopia Backup

Kopia is a fast and secure open-source backup/restore tool that allows you to create encrypted, deduplicated, and compressed backups of your files and directories. It supports multiple storage backends and provides both web UI and CLI interfaces.

## Features
* Fast, encrypted, deduplicated, and compressed backups
* Multiple storage backends (local, cloud, network)
* Web-based GUI for easy management
* Automatic snapshot scheduling
* Incremental backups with deduplication
* Cross-platform support
* Repository encryption and compression
* Snapshot browsing and restoration
* Maintenance automation

## Storage Backends Supported
* Local filesystem
* Amazon S3 and S3-compatible storage
* Google Cloud Storage
* Azure Blob Storage
* Backblaze B2
* SFTP
* WebDAV
* And many more

## Key Benefits
1. **Deduplication**: Only stores unique data blocks, saving space
2. **Encryption**: All data is encrypted before leaving your machine
3. **Compression**: Reduces backup size with built-in compression
4. **Incremental**: Only backs up changed data after initial backup
5. **Cross-platform**: Works on Windows, macOS, and Linux
6. **Reliable**: Designed for long-term data preservation

## Usage
After installation, access the web interface to:
1. Create or connect to a repository
2. Set up backup policies and schedules
3. Create manual snapshots
4. Browse and restore files
5. Monitor backup status and maintenance

## Backup Path Configuration
This container is configured to mount the entire host filesystem for maximum flexibility. When creating snapshots in the web UI, you can access any system directory by prefixing paths with `/data/`:

**Examples:**
- To backup `/home/dietpi/Documents` → enter `/data/home/dietpi/Documents`
- To backup `/media/usb-drive` → enter `/data/media/usb-drive`
- To backup `/opt/applications` → enter `/data/opt/applications`

The filesystem is mounted read-only for security, so Kopia can only read files for backup purposes.

## Documentation
For detailed configuration and usage instructions:
- Official Documentation: https://kopia.io/docs/
- GitHub Repository: https://github.com/kopia/kopia

## Folder Information
| Root Folder | Container Folder | Purpose |
|-------------|------------------|---------|
| /runtipi/app-data/kopia/data/config | /app/config | Kopia configuration files |
| /runtipi/app-data/kopia/data/cache | /app/cache | Local cache for performance |
| /runtipi/app-data/kopia/data/logs | /app/logs | Application logs |
| /runtipi/app-data/kopia/data/repository | /repository | Local repository storage (if used) |
| /runtipi/app-data/kopia/data/snapshots | /tmp | Mounted snapshots for browsing |
| / | /data | Entire host filesystem (read-only access) |
