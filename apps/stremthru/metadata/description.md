# Stremthru - Companion for Stremio

Stremthru is a companion service for Stremio that acts as an interface for external content stores. It can proxy content and provides a bridge between Stremio and various content sources through its addon system.

## Features

* **Store Interface**: Acts as an interface for external content stores
* **Content Proxy**: Can proxy content from stores for authorized requests
* **Stremio Integration**: Seamless integration with Stremio through addon system
* **HTTP Proxy Support**: Configurable HTTP proxy support
* **Tunnel Support**: Built-in tunneling capabilities
* **Authentication**: Support for proxy and store authentication
* **Database Options**: Supports SQLite and PostgreSQL databases
* **Redis Support**: Optional Redis integration for caching
* **Peer Connectivity**: Configurable peer URI for distributed setups
* **Trakt.tv Integration**: OAuth integration with Trakt.tv for enhanced features
* **Advanced Store Management**: Fine-grained control over store behavior and caching

## Supported Stores

Stremthru supports integration with multiple debrid and cloud storage services:

* **AllDebrid** - Premium debrid service
* **Debrid-Link** - Multi-hoster premium service
* **EasyDebrid** - Debrid and streaming service
* **Offcloud** - Cloud torrent service
* **PikPak** - Cloud storage service
* **Premiumize** - Premium link generator
* **RealDebrid** - Premium link generator and torrent client
* **TorBox** - Torrent and usenet service

## Configuration Guide

### Core Configuration

* **Base URL**: Set the base URL for your StremThru instance
* **Port**: Configure the listening port (default: 8080)
* **Logging**: Customize log level (DEBUG/INFO/WARN/ERROR) and format (json/text)
* **Data Directory**: Set the data storage directory

### Database Configuration

Stremthru supports multiple database backends:
* **SQLite** (default): `sqlite://./data/stremthru.db`
* **PostgreSQL**: `postgresql://user:password@host:port/database`

### Redis Configuration

Optional Redis support for caching and session management:
* **Redis URI**: `redis://host:port` or `redis://user:password@host:port`

### Proxy Configuration

* **HTTP Proxy**: Configure HTTP proxy for outbound requests
* **Proxy Auth**: Authentication credentials for proxy access
* **Tunnel**: Enable tunneling capabilities for specific hostnames
* **Store Tunnel**: Configure tunneling per store (API-only or full)

### Store Authentication

Configure authentication for external content stores:
* **Store Auth**: Format: `username:store_name:store_token`
* **Admin Users**: Comma-separated list of admin usernames
* **Store Content Proxy**: Enable/disable content proxying per store
* **Connection Limits**: Set connection limits per user
* **Cache Configuration**: Configure stale times for cached/uncached content

### Trakt.tv Integration

Enable Trakt.tv integration for enhanced features:
* **Client ID**: OAuth App Client ID from Trakt.tv
* **Client Secret**: OAuth App Client Secret from Trakt.tv
* **Redirect URI**: Should point to `/auth/trakt.tv/callback` endpoint

### Advanced Features

* **Feature Toggles**: Enable/disable specific features with +/- prefixes
* **Peer Connectivity**: Connect multiple StremThru instances
* **Content Caching**: Fine-tune caching behavior per store

## Stremio Addons

Stremthru provides multiple Stremio addon endpoints:

* **Store Addon** (`/stremio/store`): Explore and search store catalog
* **Wrap Addon** (`/stremio/wrap`): Wrap other addons with StremThru
* **Sidekick Addon** (`/stremio/sidekick`): Extra features for Stremio

## Quick Setup

1. **Basic Setup**: The default configuration uses SQLite and requires no additional setup
2. **Configure Stores**: Add your debrid service credentials
3. **Configure Authentication**: Set proxy authentication credentials
4. **Optional Services**: Configure Redis and PostgreSQL if needed
5. **Trakt.tv Setup**: Create OAuth app and configure credentials
6. **Install in Stremio**: Use the provided addon URLs in Stremio

## Store Configuration Examples

### RealDebrid
```
Store Auth: *:realdebrid:your_api_token
```

### AllDebrid
```
Store Auth: *:alldebrid:your_api_key
```

### Premiumize
```
Store Auth: *:premiumize:your_api_key
```

### PikPak
```
Store Auth: *:pikpak:email:password
```

## Security Notes

* Store authentication credentials securely
* Use strong proxy authentication credentials
* Consider using environment-specific configurations for production
* Keep Trakt.tv OAuth credentials secure
* Use HTTPS in production environments

## Advanced Usage

### Feature Toggles
Use the `STREMTHRU_FEATURE` environment variable to control features:
* `+feature1,-feature2` - Enable feature1, disable feature2
* `-opt_out_feature` - Disable an opt-out feature
* `+opt_in_feature` - Enable an opt-in feature

### Store-Specific Configuration
Configure different settings per store:
* **Tunneling**: `store_name:true/false/api`
* **Content Proxy**: `store_name:true/false`
* **Cache Timing**: `store_name:cached_time:uncached_time`

### Multi-User Setup
* Configure different store credentials per user
* Set connection limits per user
* Designate admin users for management

Happy streaming! 🎬
