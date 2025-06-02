# Stremthru - Companion for Stremio

Stremthru is a companion service for Stremio that acts as an interface for external content stores. It can proxy content and provides a bridge between Stremio and various content sources through its addon system.

## Features

* **Store Interface**: Acts as an interface for external content stores
* **Content Proxy**: Can proxy content from stores for authorized requests
* **Stremio Integration**: Seamless integration with Stremio through addon system
* **HTTP Proxy Support**: Configurable HTTP proxy support
* **Tunnel Support**: Built-in tunneling capabilities
* **Authentication**: Support for proxy and store authentication
* **Database Options**: Supports SQLite database
* **Redis Support**: Optional Redis integration for caching
* **Peer Connectivity**: Configurable peer URI for distributed setups

## Configuration Guide

### Database Configuration

Stremthru uses SQLite database:
* **SQLite** (default): `sqlite://./data/stremthru.db`

### Redis Configuration

Optional Redis support for caching and session management:
* **Redis URI**: `redis://host:port` or `redis://user:password@host:port`

### Proxy Configuration

* **HTTP Proxy**: Configure HTTP proxy for outbound requests
* **Proxy Auth**: Authentication credentials for proxy access
* **Tunnel**: Enable tunneling capabilities

### Store Authentication

Configure authentication for external content stores:
* **Store Auth**: Authentication credentials for store access

### Stremio Addon

* **Stremio Addon**: Configure the Stremio addon endpoint

## Quick Setup

1. **Basic Setup**: The default configuration uses SQLite and requires no additional setup
2. **Configure Authentication**: Set store and proxy authentication as needed
3. **Install in Stremio**: Use the provided addon URL in Stremio

## Security Notes

* Store authentication credentials securely
* Consider using environment-specific configurations for production

Happy streaming! 🎬
