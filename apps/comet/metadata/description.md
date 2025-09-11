# Comet

Advanced Stremio addon for streaming torrents with debrid services, indexer support, and comprehensive filtering capabilities.

## Overview

Comet is a powerful Stremio addon that provides seamless integration with debrid services, torrent indexers, and multiple scraping sources. It offers advanced caching, proxy support, comprehensive content filtering, and background scraping to enhance your streaming experience.

## Key Features

### 🚀 **Debrid Integration**
- Support for Real-Debrid, AllDebrid, Premiumize, and TorBox
- Built-in debrid stream proxy with connection limits
- Debrid service bypass through proxy configuration

### 🔍 **Advanced Indexing & Scraping**
- Jackett and Prowlarr integration with context modes
- Multiple scraping sources (Comet, Torrentio, MediaFusion, Zilean, Nyaa, StremThru, AIOStreams, Jackettio, DebridIO, TorBox)
- Multi-instance support for all scrapers
- Background scraper for content pre-caching
- Configurable indexer timeout and selection
- Torrent file retrieval support

### 📊 **Smart Caching**
- Metadata cache (30 days default)
- Torrent cache (15 days default) 
- Debrid cache (1 day default)
- Distributed scraping locks (5 minutes default)
- Configurable cache TTL settings

### 🛡️ **Content Control**
- Adult content filtering
- Custom header HTML support
- Dashboard password protection
- Public metrics API option
- Comprehensive logging system

### 🔄 **Background Processing**
- Automated content pre-scraping
- Configurable concurrent workers
- Scheduled scraping intervals
- Movie and series processing limits

## Configuration Reference

### **Basic Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Addon ID** | text | `stremio.comet.fast` | Unique Stremio addon identifier |
| **Addon Name** | text | `Comet` | Display name in Stremio |
| **Admin Dashboard Password** | password | *(required)* | Admin dashboard access password |
| **Public Metrics API** | boolean | `false` | Allow public access to metrics API |

### **Server Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **FastAPI Host** | text | `0.0.0.0` | Server bind address |
| **FastAPI Port** | number | `8000` | Service listening port |
| **FastAPI Workers** | number | `1` | Number of worker processes (-1 for auto-scaling) |
| **Use Gunicorn** | boolean | `true` | Use Gunicorn server (false = uvicorn) |

### **Database Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Database Type** | text | `sqlite` | Database engine: sqlite or postgresql |
| **Database URL** | text | *(blank)* | PostgreSQL connection string |
| **Database Path** | text | `data/comet.db` | SQLite database file path |
| **Database Batch Size** | number | `20000` | Batch size for import/export operations |

### **Cache Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Metadata Cache TTL** | number | `2592000` | Metadata cache duration (30 days) |
| **Torrent Cache TTL** | number | `1296000` | Torrent cache duration (15 days) |
| **Debrid Cache TTL** | number | `86400` | Debrid cache duration (1 day) |
| **Scrape Lock TTL** | number | `300` | Distributed scraping lock duration (5 minutes) |
| **Scrape Wait Timeout** | number | `30` | Max time to wait for other instances (seconds) |

### **Background Scraper**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Background Scraper Enabled** | boolean | `false` | Enable automatic background scraping |
| **Concurrent Workers** | number | `1` | Number of concurrent scraping workers |
| **Scraper Interval** | number | `3600` | Interval between scraping cycles (seconds) |
| **Max Movies Per Run** | number | `100` | Maximum movies to scrape per cycle |
| **Max Series Per Run** | number | `100` | Maximum series to scrape per cycle |

### **Indexer Manager**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Manager Type** | text | `none` | Indexer type: jackett, prowlarr, or none |
| **Manager URL** | url | *(blank)* | Jackett/Prowlarr service URL |
| **API Key** | password | *(blank)* | Indexer manager API key |
| **Manager Mode** | text | `both` | Context mode: live, background, both, false |
| **Manager Timeout** | number | `60` | Search timeout in seconds |
| **Indexers** | text | `[]` | JSON array of indexer IDs |

### **Scraping Sources**

#### **Context Modes**
Each scraper supports context modes that control when they're used:
- `true`/`both`: Used for live scraping AND background scraping (default)
- `live`: Only used for live scraping (when users request content)
- `background`: Only used for background scraping (automatic pre-caching)
- `false`: Completely disabled

#### **Multi-Instance Support**
All scrapers support multiple instances using JSON array format:
- Single URL: `https://example.com`
- Multiple URLs: `["https://example1.com", "https://example2.com"]`

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Scrape Comet** | text | `false` | Enable Comet scraping with context mode |
| **Comet URL** | text/array | `https://comet.elfhosted.com` | Comet service endpoint(s) |
| **Scrape Nyaa** | text | `false` | Enable Nyaa scraping with context mode |
| **Nyaa Anime Only** | boolean | `true` | Only scrape Nyaa for anime content |
| **Nyaa Max Concurrent Pages** | number | `5` | Max concurrent Nyaa requests |
| **Scrape Zilean** | text | `false` | Enable Zilean scraping with context mode |
| **Zilean URL** | text/array | `https://zilean.elfhosted.com` | Zilean service endpoint(s) |
| **Scrape StremThru** | text | `false` | Enable StremThru scraping with context mode |
| **StremThru Scrape URL** | text/array | `https://stremthru.13377001.xyz` | StremThru scraping endpoint(s) |
| **Scrape Torrentio** | text | `false` | Enable Torrentio scraping with context mode |
| **Torrentio URL** | text/array | `https://torrentio.strem.fun` | Torrentio service endpoint(s) |
| **Scrape MediaFusion** | text | `false` | Enable MediaFusion scraping with context mode |
| **MediaFusion URL** | text/array | `https://mediafusion.elfhosted.com` | MediaFusion service endpoint(s) |
| **MediaFusion API Password** | password | *(blank)* | API password for MediaFusion authentication |
| **MediaFusion Live Search** | boolean | `true` | Enable live search for MediaFusion |
| **Scrape AIOStreams** | text | `false` | Enable AIOStreams scraping with context mode |
| **AIOStreams URL** | text/array | *(blank)* | AIOStreams service endpoint(s) |
| **AIOStreams Credentials** | password | *(blank)* | User UUID and password (uuid:password format) |
| **Scrape Jackettio** | text | `false` | Enable Jackettio scraping with context mode |
| **Jackettio URL** | text/array | *(blank)* | Jackettio manifest URL(s) |
| **Scrape DebridIO** | text | `false` | Enable DebridIO scraping with context mode |
| **DebridIO API Key** | password | *(blank)* | API key for DebridIO service |
| **Scrape TorBox** | text | `false` | Enable TorBox scraping with context mode |
| **TorBox API Key** | password | *(blank)* | API key for TorBox service |

### **Debrid Stream Proxy**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Proxy Debrid Stream** | boolean | `false` | Enable debrid stream proxying |
| **Proxy Password** | password | *(blank)* | Password for accessing proxied streams |
| **Max Connections** | number | `-1` | Maximum concurrent connections (-1 to disable) |
| **Default Service** | text | `realdebrid` | Default debrid service for proxy |
| **Default API Key** | password | *(blank)* | Default API key for debrid service |

### **Content & UI Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Remove Adult Content** | boolean | `false` | Filter out adult content automatically |
| **Custom Header HTML** | text | *(blank)* | Custom HTML to inject in the header |
| **StremThru URL** | text | `https://stremthru.13377001.xyz` | StremThru service URL for debrid integration |

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
      - ADMIN_DASHBOARD_PASSWORD=your_password_here
      # Add other configuration variables as needed
    volumes:
      - comet_data:/data
```

### Configuration
1. Set your admin dashboard password (required)
2. Configure debrid service integration if needed
3. Set up indexer manager (Jackett/Prowlarr) if desired
4. Configure scraping sources and their context modes
5. Enable background scraper for automated content pre-caching
6. Adjust cache settings based on your needs
7. Set up proxy configuration if required

## Usage

1. **Install**: Add the addon to Stremio using the generated manifest URL
2. **Configure**: Access the dashboard to set up debrid services and filters
3. **Index**: Connect Jackett or Prowlarr for additional torrent sources
4. **Background Scraping**: Enable automatic content pre-caching for better performance
5. **Multi-Instance**: Configure multiple scraper instances for redundancy
6. **Proxy**: Configure debrid stream proxy for enhanced performance
7. **Monitor**: Use the dashboard to track performance and manage settings

## Advanced Features

### **Background Scraper**
- Automatically pre-scrapes popular content
- Configurable worker count and intervals
- PostgreSQL recommended for high worker counts
- Zilean and no-ratelimit scrapers recommended

### **Multi-Instance Scraping**
- Support for multiple instances of each scraper
- Load balancing and redundancy
- JSON array configuration format

### **Context-Aware Scraping**
- Live scraping: Real-time user requests
- Background scraping: Automated pre-caching
- Mixed mode support for optimal performance

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
