# TorBox Media Center

TorBox Media Center is a Docker container that provides seamless integration between TorBox cloud storage and your media server. It mounts your TorBox content locally, making it accessible to Plex, Jellyfin, Emby, and other media applications.

## Features

* **Cloud Storage Integration**: Direct access to your TorBox cloud files
* **Multiple Mount Methods**: Support for STRM files, WebDAV, and Rclone mounts
* **Media Server Compatible**: Works with Plex, Jellyfin, Emby, and more
* **Automatic Syncing**: Keeps your local mount synchronized with TorBox
* **Low Resource Usage**: Efficient streaming without downloading entire files
* **API Integration**: Full TorBox API support for advanced features

## Configuration Guide

### TorBox API Key

**Required**: Your TorBox API key is essential for authentication.

* **TORBOX_API_KEY**: Get your API key from your TorBox account settings at torbox.app
* **Security**: This key provides full access to your TorBox account - keep it secure!

**How to get your API key**:
1. Log in to your TorBox account
2. Navigate to Settings → API
3. Generate or copy your API key
4. Paste it into the API Key field

---

### Mount Method

Choose how TorBox content should be made available to your media server:

* **strm** (default): Creates STRM playlist files that stream directly from TorBox
* **webdav**: Mounts TorBox storage via WebDAV protocol
* **rclone**: Uses Rclone for advanced mounting options

**Recommended**: Use `strm` for most media server setups as it provides the best compatibility and performance.

---

### Mount Path

The local directory where TorBox content will be accessible:

* **Default**: `/torbox`
* **Important**: This path will be inside the container. Map it to your host using volumes.
* **Media Server Setup**: Point your media libraries to subdirectories within this mount path.

**Example Structure**:
```
/torbox
  ├── movies/
  ├── tv/
  └── downloads/
```

---

### User and Group IDs

Set the user and group IDs to match your host system for proper file permissions:

* **PUID**: User ID (typically 1000 for the first user)
* **PGID**: Group ID (typically 1000 for the first user)

**Finding your IDs**: Run `id` command in your terminal to see your UID and GID.

---

## Volume Mapping

The container needs access to a host directory for:
* Storing STRM files
* Caching metadata
* Configuration files

**Default mapping**: `/home/$(whoami)/torbox` on host → `/torbox` in container

**Customization**: You can change the host path to any directory you prefer (e.g., `/mnt/media/torbox`).

---

## Integration with Media Servers

### Plex Setup
1. Install TorBox Media Center
2. Wait for initial sync to complete
3. In Plex, add a new library
4. Point to `/DATA/torbox/movies` or `/DATA/torbox/tv` (adjust based on your Runtipi paths)
5. Scan library

### Jellyfin/Emby Setup
Similar to Plex - add the mounted TorBox path as a media library source.

---

## Important Notes

* **First Run**: Initial synchronization may take a few minutes depending on your library size
* **Internet Required**: Active internet connection needed for streaming from TorBox
* **TorBox Subscription**: Requires an active TorBox account and subscription
* **Storage**: STRM files are tiny (few KB each), so local storage requirements are minimal
* **Bandwidth**: Streaming uses bandwidth from your TorBox account

---

## Troubleshooting

### Container won't start
- Verify your TORBOX_API_KEY is correct
- Check that the mount path doesn't conflict with other containers
- Ensure the host volume directory exists and has proper permissions

### Media not showing up
- Wait for initial sync to complete (check container logs)
- Verify the mount path is correctly mapped in your media server
- Check that your TorBox account has active torrents/files

### Permission errors
- Ensure PUID and PGID match your host user
- Check that the host volume directory has appropriate ownership

---

## Quick Start

1. Enter your TorBox API key
2. Choose mount method (leave as `strm` unless you have specific needs)
3. Optionally customize the mount path
4. Set PUID/PGID if needed
5. Install and wait for initial sync
6. Add the mount path to your media server

Happy streaming! 🎬🍿