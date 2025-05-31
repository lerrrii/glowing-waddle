# Kopia Backup

Kopia is a fast and secure open-source backup/restore tool that allows you to create encrypted, deduplicated, and compressed backups of your files and directories to various storage backends.

## Features
* Fast, encrypted, deduplicated, and compressed backups
* Multiple storage backends (local, S3, Google Cloud, Azure, etc.)
* Web-based GUI for easy management
* Automatic snapshot scheduling
* Incremental backups with deduplication
* Cross-platform support

## Quick Start
1. Access the web interface after installation
2. Create or connect to a repository using the setup wizard
3. Configure backup policies and schedules
4. Create snapshots and manage backups

## Backup Configuration
When creating snapshots, you can access your host filesystem through the `/data/` path:

**Examples:**
- To backup `/home/user/documents` → enter `/data/home/user/documents`
- To backup `/opt/myapp` → enter `/data/opt/myapp`
- To backup `/media/storage` → enter `/data/media/storage`

All backup configuration (storage backends, compression, encryption, etc.) can be set up directly through the web interface.

## Documentation
- Official Documentation: https://kopia.io/docs/
- GitHub Repository: https://github.com/kopia/kopia
