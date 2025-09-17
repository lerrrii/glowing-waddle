# MediaFusion

Advanced Stremio addon with comprehensive torrent streaming, debrid integration, and multi-source scraping capabilities.

## Overview

MediaFusion is a powerful and feature-rich Stremio addon that provides seamless torrent streaming with support for multiple debrid services, comprehensive scraping from various sources, and advanced content filtering. It offers background scraping, live search capabilities, and extensive customization options to enhance your streaming experience.

## Key Features

### 🚀 **Multi-Provider Support**
- Support for Real-Debrid, AllDebrid, Premiumize, TorBox, and more
- Peer-to-peer streaming capabilities
- qBittorrent integration
- StremThru service integration

### 🔍 **Advanced Scraping & Indexing**
- **Prowlarr Integration**: Connect to your Prowlarr instance for extensive tracker support
- **Jackett Support**: Alternative indexer manager integration
- **Public Tracker Support**: BT4G, YTS, and other public trackers
- **Cross-Instance Scraping**: Torrentio, Zilean, and other MediaFusion instances
- Live title search and background scraping
- Configurable search intervals and timeouts

### 🛠️ **Comprehensive Infrastructure**
- **MongoDB**: Robust database for metadata and cache storage
- **Redis**: High-performance caching and task queue management
- **Browserless**: Headless browser for JavaScript-heavy sites
- **FlareSolverr**: CloudFlare bypass for protected trackers
- Multi-container architecture for scalability and reliability

### 📊 **Smart Caching & Performance**
- Metadata cache with configurable TTL
- Debrid cache synchronization
- Background content pre-scraping
- Distributed task processing
- Connection pooling and optimization

### 🛡️ **Content Control & Security**
- Adult content filtering with regex patterns
- API authentication and rate limiting
- Telegram notifications for contributions
- Public/private instance modes
- Comprehensive logging system

### 🎯 **Background Processing**
- Automated content discovery and caching
- Scheduled scraping from multiple sources
- Configurable worker processes
- Feed-based real-time updates
- Custom scheduler configurations

## Configuration Reference

### **Core Application Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Addon Name** | text | `MediaFusion` | Display name in Stremio |
| **Host URL** | url | *(required)* | The URL where MediaFusion is hosted |
| **Secret Key** | password | *(required)* | 32-character secret key for session security |
| **API Password** | password | *(required)* | Password for API endpoints and admin access |
| **Contact Email** | email | `admin@mediafusion.local` | Contact email for the addon |
| **Public Instance** | boolean | `false` | Enable community mode (minimal auth) |

### **Database & Cache Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **MongoDB URI** | text | `mongodb://mongodb:27017/mediafusion` | MongoDB connection string |
| **Max DB Connections** | number | `50` | Maximum database connections |
| **Redis URL** | text | `redis://redis:6379` | Redis service URL |
| **Max Redis Connections** | number | `100` | Maximum Redis connections |
| **Metadata Cache TTL** | number | `1800` | Metadata cache duration (30 minutes) |

### **Prowlarr Integration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Enable Prowlarr** | boolean | `true` | Enable/disable Prowlarr scraping |
| **Prowlarr URL** | url | `http://prowlarr:9696` | Prowlarr service endpoint |
| **Prowlarr API Key** | password | *(blank)* | API key for Prowlarr authentication |
| **Live Title Search** | boolean | `true` | Enable real-time title searching |
| **Background Search** | boolean | `true` | Enable background content scraping |
| **Search Timeout** | number | `30` | Query timeout in seconds |
| **Search Interval** | number | `72` | Search interval in hours |
| **Max Processes** | number | `10` | Maximum concurrent processes |

### **External Scraping Sources**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Enable Torrentio** | boolean | `false` | Scrape from Torrentio instances |
| **Torrentio URL** | url | `https://torrentio.strem.fun` | Torrentio service URL |
| **Enable MediaFusion** | boolean | `false` | Scrape from other MediaFusion instances |
| **MediaFusion URL** | url | `https://mediafusion.elfhosted.com` | External MediaFusion URL |
| **Enable Zilean** | boolean | `false` | Enable Zilean DHT scraping |
| **Zilean URL** | url | `https://zilean.elfhosted.com` | Zilean service endpoint |
| **Enable BT4G** | boolean | `true` | Enable BT4G public tracker scraping |
| **Enable YTS** | boolean | `true` | Enable YTS movie scraping |

### **Jackett Integration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Enable Jackett** | boolean | `false` | Enable/disable Jackett scraping |
| **Jackett URL** | url | `http://jackett:9117` | Jackett service endpoint |
| **Jackett API Key** | password | *(blank)* | API key for Jackett authentication |
| **Search Interval** | number | `72` | Search interval in hours |
| **Query Timeout** | number | `30` | Search timeout in seconds |

### **Content Filtering & Features**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Adult Content Filter** | boolean | `true` | Filter adult content from results |
| **Adult Content Regex** | text | *(blank)* | Custom regex for adult content detection |
| **Alternative Titles** | boolean | `true` | Include alternative titles in searches |
| **Rate Limiting** | boolean | `false` | Enable API rate limiting |
| **M3U8 Validation** | boolean | `true` | Validate stream URLs before serving |
| **P2P Metadata** | boolean | `true` | Fetch metadata from P2P networks |

### **Provider Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Disabled Providers** | text | `[]` | JSON array of disabled streaming providers |
| **Premiumize Client ID** | password | *(blank)* | OAuth client ID for Premiumize |
| **Premiumize Client Secret** | password | *(blank)* | OAuth client secret for Premiumize |

### **Notification Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Telegram Bot Token** | password | *(blank)* | Bot token for notifications |
| **Telegram Chat ID** | text | *(blank)* | Chat ID for sending notifications |

## Installation

### Docker Compose Setup
The app automatically deploys with a complete infrastructure stack:

```yaml
services:
  - MongoDB: Database storage
  - Redis: Caching and task queue
  - Prowlarr: Indexer management (optional)
  - FlareSolverr: CloudFlare bypass
  - Browserless: Headless browser
  - MediaFusion: Main application
```

### Configuration Steps
1. **Set Host URL**: Configure your domain or IP address
2. **Generate Secrets**: Set secret key and API password
3. **Configure Prowlarr**: Set up indexer integration (recommended)
4. **Enable Scrapers**: Choose your preferred content sources
5. **Content Filtering**: Configure adult content filters if needed
6. **Debrid Services**: Connect your premium services
7. **Notifications**: Set up Telegram alerts (optional)

## Usage

1. **Installation**: Add the generated manifest URL to Stremio
2. **Initial Setup**: Access the admin panel to configure scrapers
3. **Prowlarr Setup**: Configure trackers in Prowlarr web interface
4. **Content Discovery**: Background scrapers will populate content automatically
5. **Manual Triggers**: Use `/scraper` endpoint for manual content updates
6. **Monitoring**: Check logs and metrics for performance insights

## Advanced Features

### **Background Scraping**
- Automated content discovery from configured sources
- Scheduled scraping with customizable intervals
- Feed-based real-time updates from trackers
- Distributed processing for high throughput

### **Multi-Source Integration**
- Prowlarr for extensive private tracker support
- Jackett as alternative indexer manager
- Public trackers (BT4G, YTS) for broad coverage
- Cross-instance scraping for content sharing

### **Performance Optimization**
- Redis caching for fast content delivery
- Connection pooling for database efficiency
- Background processing for reduced latency
- Configurable worker processes

### **Content Management**
- Advanced filtering for adult content
- Custom regex patterns for content detection
- Alternative title matching for better discovery
- Metadata synchronization across sources

### **Infrastructure Components**
- **MongoDB**: Scalable document storage
- **Redis**: High-performance caching layer
- **Browserless**: JavaScript execution for modern sites
- **FlareSolverr**: Anti-bot protection bypass
- **Prowlarr/Jackett**: Professional indexer management

## Accessing Services

- **MediaFusion**: `https://your-domain.com` (main interface)
- **Prowlarr**: `https://your-domain.com:9696` (indexer management)
- **Admin Panel**: `https://your-domain.com/admin` (configuration)
- **Scraper Control**: `https://your-domain.com/scraper` (manual triggers)
- **API Docs**: `https://your-domain.com/docs` (OpenAPI documentation)

---

**Repository**: [https://github.com/mhdzumair/MediaFusion](https://github.com/mhdzumair/MediaFusion)  
**Author**: mhdzumair + Runtipi community  
**Version**: latest