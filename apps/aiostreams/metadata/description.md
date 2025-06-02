# AIOStreams

Aggregate and filter multiple Stremio addons and debrid services into one configurable addon with advanced filtering, proxy support, and unified interface.

## Overview

AIOStreams+ is a powerful Stremio addon aggregator that combines multiple upstream addons and debrid services into a single, highly configurable interface. It provides advanced filtering, sorting, deduplication, and proxy capabilities to streamline your streaming experience.

## Key Features

### 🔗 **Unified Interface**
- Aggregate up to 15 different Stremio addons
- Single endpoint for all your streaming sources
- Consistent API across all upstream services

### 🎯 **Advanced Filtering & Sorting**
- **Regex Filtering**: Include/exclude streams with custom patterns
- **Keyword Filters**: Up to 30 keyword-based filters
- **Size Limits**: Configurable max sizes for movies (150GB) and episodes (150GB)
- **Quality & Language Filtering**: Fine-tune results by resolution and language
- **Custom Sorting**: Up to 30 regex-based sorting patterns
- **Result Deduplication**: Eliminate duplicate streams automatically

### 🌐 **Proxy Integration**
- **MediaFlow Proxy**: Built-in support with encryption
- **StremThru Proxy**: Alternative proxy service with credential support
- **Configurable Rules**: Domain-specific proxy routing with wildcard support
- **IP Override**: Custom public IP configuration for proxy services

### ⚙️ **Advanced Configuration**
- **Deterministic IDs**: Consistent addon IDs across reinstalls
- **API Key Protection**: Optional API key for regex filter access
- **Timeout Controls**: Configurable timeouts (1-50 seconds) per service
- **Logging Options**: Debug/info/warn/error levels with JSON/text formats
- **Security**: 64-character hex secret key for config encryption

## Supported Services

### **Debrid Services**
- **Comet** (`https://comet.elfhosted.com/`)
- **MediaFusion** (`https://mediafusion.elfhosted.com/`)
- **TorBox Stremio** (`https://stremio.torbox.app/`)
- **Debridio** (`https://debridio.adobotec.com/`)

### **Torrent/Public Trackers**
- **JackettIO** (`https://jackettio.elfhosted.com/`)
  - Default indexers: bitsearch, eztv, thepiratebay, therarbg, yts
- **Stremio-Jackett** (`https://stremio-jackett.elfhosted.com/`)
- **Torrentio** (`https://torrentio.strem.fun/`)
- **Peerflix** (`https://peerflix-addon.onrender.com/`)

### **Usenet Services**
- **Easynews+** (`https://b89262c192b0-stremio-easynews-addon.baby-beamup.club/`)
- **Easynews++** (`https://easynews-cloudflare-worker.jqrw92fchz.workers.dev/`)
- **Easynews** (`https://ea627ddf0ee7-easynews.baby-beamup.club/`)

### **Premium Services**
- **Orion Stremio Addon** (`https://5a0d1888fa64-orion.baby-beamup.club/`)

### **Additional Services**
- **StremThru Store** - Proxy store functionality
- **DMM Cast** - Custom casting service
- **Stremio GDrive** - Google Drive integration

## Configuration Reference

### **Basic Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Addon Name** | text | `AIOStreams` | Display name in Stremio |
| **Addon ID** | text | `aiostreams.viren070.com` | Unique addon identifier |
| **Deterministic Addon ID** | boolean | `true` | Generate consistent IDs for reinstalls |
| **Port** | number | `3000` | Service listening port |
| **Secret Key** | password | *(auto-generated)* | 64-char hex encryption key |
| **API Key** | text | *(blank)* | Required for regex filters; blank = disabled |

### **Interface & Logging**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Show Dice Emoji** | boolean | `false` | Display 🎲 in stream results |
| **Log Level** | text | `info` | Verbosity: debug/info/warn/error |
| **Log Format** | text | `text` | Output format: text or json |
| **Log Sensitive Info** | boolean | `true` | Include API keys in logs |

### **Proxy Configuration**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Addon Proxy URL** | url | *(blank)* | Global proxy for addon requests |
| **Proxy Rules** | text | *(blank)* | Domain-specific rules (e.g., `*:false,*.strem.fun:true`) |

### **Limits & Performance**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **Max Addons** | number | `15` | Maximum aggregated addons |
| **Max Keyword Filters** | number | `30` | Keyword filter limit |
| **Max Regex Sort Patterns** | number | `30` | Custom sorting rule limit |
| **Max Movie Size** | number | `161061273600` | 150 GiB size limit |
| **Max Episode Size** | number | `161061273600` | 150 GiB size limit |
| **Default Timeout** | number | `15000` | Request timeout (15s) |
| **Max Override Timeout** | number | `50000` | Maximum configurable timeout |
| **Min Override Timeout** | number | `1000` | Minimum configurable timeout |

### **MediaFlow Proxy Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **MediaFlow URL** | url | `https://mediaflow.elfhosted.com/` | MediaFlow proxy service |
| **MediaFlow API Password** | text | *(blank)* | Self-hosted MediaFlow password |
| **MediaFlow Public IP** | text | *(blank)* | Override public IP |
| **Encrypt MediaFlow URLs** | boolean | `true` | Enable URL encryption |
| **MediaFlow IP Timeout** | number | `30000` | IP lookup timeout |

### **StremThru Proxy Settings**
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| **StremThru URL** | url | *(blank)* | StremThru proxy service |
| **StremThru Credentials** | text | *(blank)* | `username:password` or base64 |
| **StremThru Public IP** | text | *(blank)* | Override public IP |
| **Encrypt StremThru URLs** | boolean | `true` | Enable URL encryption |
| **StremThru Timeout** | number | `30000` | Request timeout |

### **Service-Specific Timeouts**
Each supported service has configurable timeout settings:
- **Comet Timeout**: Default connection timeout
- **MediaFusion Timeout**: Request timeout + 5s config timeout
- **JackettIO Timeout**: With StremThru proxy support
- **Stremio-Jackett**: Requires Jackett URL/API key + TMDB key
- **Torrentio, TorBox, Peerflix**: Individual timeout controls
- **Easynews services**: Separate timeouts for each variant
- **Orion, Debridio**: Custom timeout settings

## Installation

### Docker Compose
```yaml
version: '3.8'
services:
  aiostreams:
    image: viren070/aiostreams:latest
    ports:
      - "3000:3000"
    environment:
      - ADDON_NAME=AIOStreams+
      - PORT=3000
      # Add other configuration variables as needed
```

### Configuration
1. Set your desired addon name and ID
2. Configure proxy settings if needed
3. Set API key for regex filter access
4. Adjust timeouts based on your network
5. Configure individual service URLs and credentials

## Usage

1. **Install**: Add the addon to Stremio using the generated manifest URL
2. **Configure**: Use the web interface to set up filtering rules and service priorities
3. **Filter**: Create regex patterns and keyword filters for your preferred content
4. **Proxy**: Route traffic through MediaFlow or StremThru for enhanced privacy
5. **Monitor**: Use configurable logging to track performance and issues

## Advanced Features

### **Regex Filtering**
- **Include Patterns**: Only show streams matching specific criteria
- **Exclude Patterns**: Filter out unwanted content
- **Sort Patterns**: Custom ordering based on stream properties

### **Proxy Routing**
- **Global Proxy**: Route all requests through a single proxy
- **Domain Rules**: Specific proxy rules per domain with wildcard support
- **Encryption**: Secure URL encryption for proxy services

### **Performance Optimization**
- **Deduplication**: Automatic removal of duplicate streams
- **Size Limits**: Prevent oversized files from cluttering results
- **Timeout Control**: Fine-tune response times per service
- **Result Limiting**: Control maximum results per addon

---

**Repository**: [https://github.com/Viren070/AIOStreams](https://github.com/Viren070/AIOStreams)  
**Author**: viren070 + Runtipi community  
**Version**: latest
