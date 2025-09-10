# FlexGet

FlexGet is a multipurpose automation tool for all of your media. Support for torrents, nzbs, podcasts, comics, TV, movies, RSS, HTML, CSV, and more.

## Features

* **Automated Downloads**: Monitor RSS feeds, torrent sites, and other sources
* **Flexible Filtering**: Advanced filtering and sorting capabilities
* **Multiple Sources**: Support for torrents, NZBs, podcasts, comics, and more  
* **Web Interface**: Built-in web UI for configuration and monitoring
* **Plugin System**: Extensive plugin architecture for customization
* **Scheduling**: Built-in scheduler for automated tasks
* **Quality Management**: Automatic quality upgrading and management

## Default Access

- **Web Interface**: `http://your-server-ip:5050`
- **Default Password**: Set via the configuration form
- **Config Location**: `/config` (automatically mounted)
- **Data Location**: `/data` (for downloads and processing)

## Configuration

### Initial Setup

1. Access the web interface after installation
2. Use the password you set during app installation
3. Configure your sources (RSS feeds, torrent sites, etc.)
4. Set up your download destinations
5. Create tasks for automated processing

### Common Use Cases

* **TV Show Management**: Automatically download new episodes
* **Movie Collection**: Monitor for new releases and quality upgrades
* **Podcast Management**: Download and organize podcast episodes
* **Comic Downloads**: Automated comic book downloads
* **Quality Upgrading**: Replace lower quality files with better versions

## Important Notes

* FlexGet requires configuration through YAML files or the web interface
* The web UI runs on the port you specify (default: 5050)
* Data and config are persisted in Docker volumes
* Check FlexGet documentation for advanced configuration options

## Security Recommendations

* Use a strong password for the web interface
* Consider running behind a reverse proxy for HTTPS
* Limit access to trusted networks only
* Regular backups of configuration recommended