# Jackettio

Selfhosted Stremio addon that resolves streams using Jackett and Debrid services. It seamlessly integrates with private trackers and provides comprehensive torrent filtering and sorting capabilities.

## Overview

Jackettio is a powerful Stremio addon that bridges Jackett torrent indexers with debrid services to provide high-quality streaming links. It offers advanced caching, content filtering, and seamless integration with both public and private trackers.

## Key Features

### 🔍 **Jackett Integration**
- Full Jackett API integration with configurable timeout
- Support for public and private trackers
- Automatic indexer management and monitoring
- Slow indexer detection and handling

### 🚀 **Debrid Services Support**
- Real-Debrid, AllDebrid, and Debrid-Link integration
- Automatic cached torrent detection
- StremThru integration for enhanced streaming
- MediaFlow proxy support for improved performance

### 📊 **Smart Content Management**
- TV pack prioritization for series content
- Configurable quality filtering (360p to 4K)
- Advanced sorting options (quality, seeders, size)
- Keyword exclusion filters
- Language prioritization

### 🛡️ **Performance & Security**
- Intelligent caching system (search results, metadata)
- Rate limiting and request throttling
- Private tracker passkey protection
- Configurable user restrictions

### 🎯 **User Customization**
- Flexible configuration system
- Per-user settings with admin overrides
- Custom welcome messages
- Immutable configuration options for public instances

## Configuration Reference

### **Basic Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Addon ID** | text | `community.stremio.jackettio` | Unique Stremio addon identifier |
| **Addon Name** | text | `Jackettio` | Display name in Stremio |
| **Addon Description** | text | *(default description)* | Addon description shown in Stremio |
| **Addon Icon** | url | `https://avatars.githubusercontent.com/u/15383019?s=48&v=4` | Addon icon URL |

### **Server Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Server Port** | number | `4000` | Service listening port |
| **Trust Proxy** | text | `loopback, linklocal, uniquelocal` | Express.js proxy trust settings |
| **Data Folder** | text | `/data` | Persistent data storage path |

### **Jackett Integration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Jackett URL** | url | `http://localhost:9117` | Jackett instance URL |
| **Jackett API Key** | password | *(required)* | Jackett API key for authentication |

### **External Services**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **TMDB Access Token** | password | *(blank)* | The Movie Database API token for metadata |
| **Enable Localtunnel** | boolean | `false` | Enable public access via localtunnel |

### **Cache Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Cache Type** | text | `sqlite` | Cache storage: sqlite or redis |
| **Redis Host** | text | `localhost` | Redis server hostname (if using redis) |
| **Redis Port** | number | `6379` | Redis server port |
| **Redis Database** | number | `0` | Redis database index |
| **Redis Password** | password | *(blank)* | Redis authentication password |

### **Rate Limiting & Performance**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Rate Limit Window** | number | `3600` | Rate limit time window in seconds (1 hour) |
| **Rate Limit Requests** | number | `150` | Maximum requests per window |
| **Slow Indexer Duration** | number | `20` | Time in seconds to identify slow indexers |
| **Slow Indexer Window** | number | `1800` | Monitoring window for slow indexers (30 minutes) |
| **Slow Indexer Requests** | number | `5` | Consecutive slow requests before disabling indexer |

### **Private Tracker Security**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Replace Passkey** | password | *(blank)* | Your passkey to be replaced with user's passkey |
| **Passkey Info URL** | url | *(blank)* | URL where users can find their passkey |
| **Passkey Pattern** | text | `[a-zA-Z0-9]+` | Regular expression pattern for passkey validation |

### **User Configuration Defaults**

#### **Content Quality & Filtering**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Default Qualities** | text | `0, 720, 1080` | Comma-separated quality values (0=Unknown, 360, 480, 720, 1080, 2160) |
| **Default Max Torrents** | number | `8` | Maximum torrents to display per search |
| **Default Exclude Keywords** | text | *(blank)* | Comma-separated keywords to exclude from results |

#### **Language & Priority Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Default Prioritize Languages** | text | *(blank)* | Comma-separated language priorities (e.g., english, french) |
| **Default Prioritize Pack Torrents** | number | `2` | Priority level for TV pack torrents (0=disabled, 1=low, 2=high) |
| **Default Meta Language** | text | *(blank)* | ISO 639-1 language code for metadata (e.g., en, fr, de) |

#### **Caching & Performance**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Default Force Cache Next Episode** | boolean | `false` | Automatically cache next episode when watching series |
| **Default Indexer Timeout** | number | `60` | Timeout in seconds for indexer searches |
| **Default Indexers** | text | `all` | Comma-separated indexer IDs or 'all' |

#### **Sorting & Display**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Default Sort Cached** | text | `quality:true, size:true` | Sort order for cached torrents (key:reverse format) |
| **Default Sort Uncached** | text | `seeders:true` | Sort order for uncached torrents |
| **Default Hide Uncached** | boolean | `false` | Hide torrents not available in debrid cache |

#### **Debrid & Streaming**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Default Debrid Service** | text | `realdebrid` | Default debrid service (realdebrid, alldebrid, debridlink) |
| **Default Use StremThru** | boolean | `true` | Enable StremThru integration |
| **StremThru URL** | url | `https://stremthru.13377001.xyz` | StremThru service URL |

#### **MediaFlow Integration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Default Enable MediaFlow** | boolean | `false` | Enable MediaFlow proxy integration |
| **Default MediaFlow Proxy URL** | url | *(blank)* | MediaFlow proxy service URL |
| **Default MediaFlow API Password** | password | *(blank)* | MediaFlow API password |
| **Default MediaFlow Public IP** | text | *(blank)* | Public IP for MediaFlow configuration |

### **Admin Controls**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Immutable User Config Keys** | text | *(blank)* | Comma-separated config keys users cannot modify |
| **Welcome Message** | text | *(blank)* | Custom welcome message in Markdown format |
| **Trust CF IP Header** | boolean | `false` | Trust CloudFlare IP headers for rate limiting |

## Installation

### Docker Compose
```yaml
version: '3.8'
services:
  jackettio:
    image: arvida42/jackettio:latest
    ports:
      - "4000:4000"
    environment:
      - ADDON_NAME=Jackettio
      - JACKETT_URL=http://jackett:9117
      - JACKETT_API_KEY=your_api_key_here
      - DATA_FOLDER=/data
    volumes:
      - jackettio_data:/data
```

### Prerequisites
- **Jackett instance**: Must be running and accessible
- **Debrid service account**: Real-Debrid, AllDebrid, or Debrid-Link
- **Domain (optional)**: For public access and HTTPS

## Configuration

1. **Install Jackett**: Set up Jackett with your preferred indexers
2. **Configure Jackett**: Get your API key from Jackett dashboard
3. **Set up Jackettio**: Configure the Jackett URL and API key
4. **Add to Stremio**: Use the generated manifest URL
5. **Configure Debrid**: Add your debrid service credentials in the user settings
6. **Customize Filters**: Set quality preferences, languages, and exclusions

## Usage

1. **Setup**: Configure your Jackett instance and indexers
2. **Install**: Add the addon to Stremio using the manifest URL
3. **Configure**: Set your debrid credentials and preferences
4. **Stream**: Search for content in Stremio and enjoy cached streams
5. **Optimize**: Fine-tune quality settings and exclusion filters

## Advanced Features

### **Private Tracker Support**
- Secure passkey handling for private trackers
- User-specific passkey replacement
- Configurable passkey patterns and validation

### **Performance Optimization**
- Intelligent caching of search results and metadata
- Slow indexer detection and automatic disabling
- Configurable rate limiting and timeouts

### **Content Filtering**
- Advanced quality filtering with custom ranges
- Language-based prioritization
- Keyword exclusion for unwanted content
- TV pack prioritization for series

### **Admin Controls**
- Lock specific settings for public instances
- Custom welcome messages and branding
- Comprehensive logging and monitoring

---

**Repository**: [https://github.com/arvida42/jackettio](https://github.com/arvida42/jackettio)  
**Author**: arvida42 + Runtipi community  
**Version**: latest