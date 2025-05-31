# Kopia Backup

Kopia is a fast and secure open-source backup/restore tool that allows you to create encrypted, deduplicated, and compressed backups of your files and directories. It supports multiple storage backends and provides both a web-based GUI and a CLI.

## Features
- Fast, encrypted, deduplicated, and compressed backups
- Multiple storage backends (local filesystem, S3, GCS, Azure, Backblaze B2, SFTP, WebDAV, etc.)
- Web-based GUI for easy management
- Automatic snapshot scheduling
- Incremental backups with deduplication
- Cross-platform support (Windows, macOS, Linux)
- Repository encryption and compression
- Snapshot browsing and restoration
- Maintenance automation
- **Timezone configuration** via `TZ` environment variable (defaults to Europe/Prague)

## Simple Docker Setup

This container is designed so that **all** repository creation and configuration (compression, snapshot scheduling, retention policies, etc.) is done **in the Kopia Web UI** after the container starts. You only need to supply:

1. **Repository master password** (`KOPIA_PASSWORD`)  
2. **Web UI username/password** (`KOPIA_SERVER_USERNAME`, `KOPIA_SERVER_PASSWORD`)  
3. *(Optional)* `TZ` for logs/timestamp timezone  
4. *(Optional)* `KOPIA_ENABLE_TLS`, plus your TLS certificate/key (if you want HTTPS)  
5. *(Optional)* `KOPIA_LOG_DEBUG` (enable debug logging)  
6. *(Optional)* `KOPIA_DATA_PATH` to restrict what host path is visible to Kopia (default is `/`)

After deployment, simply open your browser to `http://<your-domain>:51515/` (or `https://…` if TLS is enabled), log in, and click **“Create new repository”**. From there, choose “Local filesystem” or any of the supported backends (S3, GCS, Azure, B2, SFTP, WebDAV) and fill in the details. Once the repository exists, use the Web UI to set up backup policies, schedules, and to browse/restore snapshots.

> **Tip:** If you only want to back up a subfolder (e.g. `/home/dietpi`), set `KOPIA_DATA_PATH=/home/dietpi` in your environment. Then Kopia will only see `/home/dietpi` (read-only) instead of the entire root.

## Volumes & Paths

| Host Folder                             | Container Folder | Purpose                                                                                                     |
|-----------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------|
| `${APP_DATA_DIR}/data/config`           | `/app/config`    | Kopia configuration (e.g. TLS certs, future CLI configs)                                                    |
| `${APP_DATA_DIR}/data/cache`            | `/app/cache`     | Local cache for performance                                                                                |
| `${APP_DATA_DIR}/data/logs`             | `/app/logs`      | Kopia server logs                                                                                           |
| `${APP_DATA_DIR}/data/repository`       | `/repository`    | Filesystem repository (initially empty; created via the Web UI)                                             |
| `${APP_DATA_DIR}/data/snapshots`        | `/tmp`           | Mounted snapshots for browsing/restore tests                                                                |
| *Host path defined by* `KOPIA_DATA_PATH` | `/data`          | Whatever host path you want Kopia to back up (read-only). Default `/` mounts entire host filesystem. |

## Documentation & Links

- Official Documentation: https://kopia.io/docs/  
- GitHub Repository: https://github.com/kopia/kopia

---

## 2) `config.json`

```json
{
  "$schema": "../app-info-schema.json",
  "name": "Kopia+",
  "available": true,
  "exposable": true,
  "dynamic_config": true,
  "port": 51515,
  "id": "kopia",
  "tipi_version": 1,
  "version": "latest",
  "categories": ["utilities", "data"],
  "description": "Fast, secure, open-source backup/restore tool with Web UI. All repo creation and policies are done in the Web UI.",
  "short_desc": "Encrypted, deduplicated backup solution with Web UI.",
  "author": "Kopia Project",
  "source": "https://github.com/kopia/kopia",
  "form_fields": [
    {
      "type": "number",
      "label": "Container ▶ UserID (UID)",
      "placeholder": "1000",
      "env_variable": "KOPIA_PUID",
      "default": 1000
    },
    {
      "type": "number",
      "label": "Container ▶ GroupID (PGID)",
      "placeholder": "1000",
      "env_variable": "KOPIA_PGID",
      "default": 1000
    },
    {
      "type": "text",
      "label": "Server ▶ Timezone",
      "placeholder": "Europe/Prague",
      "env_variable": "TZ",
      "default": "Europe/Prague"
    },
    {
      "type": "password",
      "label": "Repository ▶ Master Password",
      "required": true,
      "placeholder": "Strong passphrase for repository encryption",
      "env_variable": "KOPIA_PASSWORD"
    },
    {
      "type": "text",
      "label": "Server ▶ Username",
      "required": true,
      "placeholder": "admin",
      "env_variable": "KOPIA_SERVER_USERNAME",
      "default": "admin"
    },
    {
      "type": "password",
      "label": "Server ▶ Password",
      "required": true,
      "placeholder": "Web UI login password",
      "env_variable": "KOPIA_SERVER_PASSWORD"
    },
    {
      "type": "text",
      "label": "Server ▶ Hostname",
      "placeholder": "kopia-server",
      "env_variable": "KOPIA_HOSTNAME",
      "default": "kopia-server"
    },
    {
      "type": "boolean",
      "label": "Security ▶ Enable TLS/HTTPS",
      "env_variable": "KOPIA_ENABLE_TLS",
      "default": false
    },
    {
      "type": "text",
      "label": "TLS ▶ Certificate File Path",
      "placeholder": "/app/config/server.crt",
      "env_variable": "KOPIA_TLS_CERT_FILE",
      "default": ""
    },
    {
      "type": "text",
      "label": "TLS ▶ Private Key File Path",
      "placeholder": "/app/config/server.key",
      "env_variable": "KOPIA_TLS_KEY_FILE",
      "default": ""
    },
    {
      "type": "boolean",
      "label": "Logging ▶ Enable Debug Mode",
      "env_variable": "KOPIA_LOG_DEBUG",
      "default": false
    },
    {
      "type": "text",
      "label": "Backup ▶ Data Directory to Mount",
      "placeholder": "/data",
      "env_variable": "KOPIA_DATA_PATH",
      "default": "/"
    }
  ],
  "supported_architectures": ["arm64", "amd64"],
  "created_at": 1735564800000,
  "updated_at": 1735564800000
}
