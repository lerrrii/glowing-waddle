# Comet

Advanced Stremio addon for streaming torrents with debrid services, indexer support, and comprehensive filtering capabilities.

## Overview

Comet is a powerful Stremio addon that provides seamless integration with debrid services, torrent indexers, and multiple scraping sources. It offers advanced caching, proxy support, and comprehensive content filtering to enhance your streaming experience.

## Key Features

### 🚀 **Debrid Integration**
- Support for Real-Debrid, AllDebrid, Premiumize, and TorBox
- Built-in debrid stream proxy with connection limits
- Debrid service bypass through proxy configuration

### 🔍 **Advanced Indexing**
- Jackett and Prowlarr integration
- Multiple scraping sources (Torrentio, MediaFusion, Zilean)
- Configurable indexer timeout and selection
- Torrent file retrieval support

### 📊 **Smart Caching**
- Metadata cache (30 days default)
- Torrent cache (15 days default) 
- Debrid cache (1 day default)
- Configurable cache TTL settings

### 🛡️ **Content Control**
- Adult content filtering
- Custom header HTML support
- Dashboard password protection
- Comprehensive logging system

## Configuration Reference

### **Basic Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Addon ID** | text | `stremio.comet.fast` | Unique Stremio addon identifier |
| **Addon Name** | text | `Comet` | Display name in Stremio |
| **Dashboard Password** | password | *(required)* | Admin dashboard access password |

### **Server Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **FastAPI Host** | text | `0.0.0.0` | Server bind address |
| **FastAPI Port** | number | `8000` | Service listening port |
| **FastAPI Workers** | number | `1` | Number of worker processes |
| **Use Gunicorn** | boolean | `true` | Use Gunicorn server (false = uvicorn) |

### **Database Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Database Type** | text | `sqlite` | Database engine: sqlite or postgresql |
| **Database URL** | text | *(blank)* | PostgreSQL connection string |
| **Database Path** | text | `data/comet.db` | SQLite database file path |

### **Cache Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Metadata Cache TTL** | number | `2592000` | Metadata cache duration (30 days) |
| **Torrent Cache TTL** | number | `1296000` | Torrent cache duration (15 days) |
| **Debrid Cache TTL** | number | `86400` | Debrid cache duration (1 day) |

### **Indexer Manager**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Manager Type** | text | `none` | Indexer type: jackett, prowlarr, or none |
| **Manager URL** | url | *(blank)* | Jackett/Prowlarr service URL |
| **API Key** | password | *(blank)* | Indexer manager API key |
| **Manager Timeout** | number | `60` | Search timeout in seconds |
| **Indexers** | text | `[]` | JSON array of indexer IDs |

### **Scraping Sources**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Scrape Comet** | boolean | `true` | Enable Comet scraping |
| **Comet URL** | url | `https://comet.elfhosted.com` | Comet service endpoint |
| **Scrape Zilean** | boolean | `true` | Enable Zilean scraping |
| **Zilean URL** | url | `https://zilean.elfhosted.com` | Zilean service endpoint |
| **Scrape Torrentio** | boolean | `true` | Enable Torrentio scraping |
| **Torrentio URL** | url | `https://torrentio.strem.fun` | Torrentio service endpoint |
| **Scrape MediaFusion** | boolean | `true` | Enable MediaFusion scraping |
| **MediaFusion URL** | url | `https://mediafusion.elfhosted.com` | MediaFusion service endpoint |

## Installation

### Docker Compose
```yaml
version: '3.8'
services:
  comet:
    image: g0ldyy/comet:latest
    ports:
      - "8000:8000"
    environment:
      - ADDON_NAME=Comet
      - ADDON_ID=stremio.comet.fast
      - DASHBOARD_ADMIN_PASSWORD=your_password_here
      # Add other configuration variables as needed
    volumes:
      - comet_data:/data
```

### Configuration
1. Set your dashboard admin password
2. Configure debrid service integration
3. Set up indexer manager (Jackett/Prowlarr) if needed
4. Configure scraping sources and URLs
5. Adjust cache settings based on your needs
6. Set up proxy configuration if required

## Usage

1. **Install**: Add the addon to Stremio using the generated manifest URL
2. **Configure**: Access the dashboard to set up debrid services and filters
3. **Index**: Connect Jackett or Prowlarr for additional torrent sources
4. **Proxy**: Configure debrid stream proxy for enhanced performance
5. **Monitor**: Use the dashboard to track performance and manage settings

## Advanced Features

### **Debrid Stream Proxy**
- Proxy debrid streams through Comet
- Connection limiting and password protection
- Default service and API key configuration

### **Content Filtering**
- Remove adult content automatically
- Custom header HTML injection
- Comprehensive torrent filtering

---

**Repository**: [https://github.com/g0ldyy/comet](https://github.com/g0ldyy/comet)  
**Author**: g0ldyy + Runtipi community  
**Version**: latest