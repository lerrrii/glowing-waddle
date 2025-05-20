# AIOStreams

Aggregate and filter multiple Stremio addons and debrid services into one configurable addon.

## Key Features

- **Unified Interface** across all upstream addons  
- **Advanced Filtering & Sorting** (regex, size, quality, language, etc.)  
- **Proxy Integration** via MediaFlow or StremThru  
- **Result Deduplication** and Limiting  
- **Custom Formatters** for output styling  

## Configuration Reference

| Field                          | Type      | Default                                                      | Rationale / Example                                                 |
| ------------------------------ | --------- | ------------------------------------------------------------ | -------------------------------------------------------------------- |
| **Addon Name**                 | text      | `AIOStreams`                                                 | Friendly label — e.g. `AIOStreams`                                   |
| **Addon ID**                   | text      | `aiostreams.viren070.com`                                    | Unique ID — e.g. `aiostreams.viren070.com`                           |
| **Deterministic Addon ID**     | boolean   | `true`                                                       | Predictable IDs for repeat installs                                  |
| **Port**                       | number    | `3000`                                                       | Service listen port                                                  |
| **Secret Key**                 | password  | *(blank)*                                                    | 64-char hex; auto-generated if blank                                  |
| **API Key**                    | text      | *(blank)*                                                    | Required for regex filters; blank → disabled                         |
| **Show Dice Emoji**            | boolean   | `false`                                                      | Toggle 🎲 in results                                                  |
| **Log Level**                  | text      | `info`                                                       | One of `debug`/`info`/`warn`/`error`                                 |
| **Log Format**                 | text      | `text`                                                       | `text` or `json`                                                     |
| **Log Sensitive Info**         | boolean   | `true`                                                       | Toggle logging of secrets                                             |
| **Addon Proxy URL**            | url       | *(blank)*                                                    | e.g. `http://warp:1080`                                               |
| **Proxy Rules**                | text      | *(blank)*                                                    | e.g. `*:false,*.strem.fun:true`                                       |
| **Max Addons**                 | number    | `15`                                                         | Upper bound on aggregated addons                                      |
| **Max Keyword Filters**        | number    | `30`                                                         | Maximum keyword-filter entries                                        |
| **Max Regex Sort Patterns**    | number    | `30`                                                         | Max custom regex sorting rules                                        |
| **Max Movie Size**             | number    | `161061273600`                                               | 150 GiB in bytes                                                      |
| **Max Episode Size**           | number    | `161061273600`                                               | 150 GiB in bytes                                                      |
| **Max Override Timeout**       | number    | `50000`                                                      | Max overrideable timeout (ms)                                         |
| **Min Override Timeout**       | number    | `1000`                                                       | Min overrideable timeout (ms)                                         |
| **Default Timeout**            | number    | `15000`                                                      | Fallback timeout (ms)                                                 |
| **Default Regex Exclude Pattern** | text   | *(blank)*                                                    | Filter out streams matching pattern                                   |
| **Default Regex Include Pattern** | text   | *(blank)*                                                    | Only include streams matching pattern                                 |
| **Default Regex Sort Patterns**   | text   | *(blank)*                                                    | Custom regex-based ordering                                           |
| **MediaFlow IP Timeout**       | number    | `30000`                                                      | Timeout for MediaFlow IP lookups (ms)                                 |
| **Default MediaFlow URL**      | url       | `https://mediaflow.elfhosted.com/`                           | Built-in default; override if self-hosted                             |
| **Default MediaFlow API Pass** | text      | *(blank)*                                                    | When auto-configuring via MediaFusion                                 |
| **Default MediaFlow Public IP**| text      | *(blank)*                                                    | Public IP for MediaFlow proxy                                         |
| **Encrypt MediaFlow URLs**     | boolean   | `true`                                                       | Wrap each URL in encryption                                           |
| **StremThru Timeout**          | number    | `30000`                                                      | Proxy timeout for StremThru (ms)                                      |
| **Default StremThru URL**      | url       | *(blank)*                                                    | e.g. `https://stremthru.myhost.com/`                                  |
| **Default StremThru Creds**    | text      | *(blank)*                                                    | `username:password` or base64                                         |
| **Default StremThru Public IP**| text      | *(blank)*                                                    | Public IP for StremThru proxy                                         |
| **Encrypt StremThru URLs**     | boolean   | `true`                                                       | Encrypt StremThru links                                               |
| **Comet URL**                  | url       | `https://comet.elfhosted.com/`                               | Built-in default                                                      |
| **Default Comet Timeout**      | number    | *(blank)*                                                    | Timeout for Comet requests (ms)                                       |
| **Force Comet Hostname**       | text      | *(blank)*                                                    | Override hostname in Comet URLs                                       |
| **Force Comet Port**           | text      | *(blank)*                                                    | Override port in Comet URLs                                           |
| **Force Comet Protocol**       | text      | *(blank)*                                                    | Override protocol in Comet URLs                                       |
| **MediaFusion URL**            | url       | `https://mediafusion.elfhosted.com/`                         | Built-in default                                                      |
| **Default MediaFusion Timeout**| number    | *(blank)*                                                    | Timeout for MediaFusion requests (ms)                                 |
| **MediaFusion Config Timeout** | number    | `5000`                                                       | Timeout for MediaFusion config-related endpoints (ms)                 |
| **MediaFusion API Password**   | text      | *(blank)*                                                    | Password for self-hosted MediaFusion                                  |
| **JackettIO URL**              | url       | `https://jackettio.elfhosted.com/`                           | Built-in default                                                      |
| **Default JackettIO Indexers** | text      | `["bitsearch","eztv","thepiratebay","therarbg","yts"]`       | JSON array string                                                     |
| **Default JackettIO Timeout**  | number    | *(blank)*                                                    | Timeout for JackettIO requests (ms)                                   |
| **Default JackettIO StremThru URL** | url  | `https://stremthru.13377001.xyz`                             | StremThru proxy URL for JackettIO                                     |
| **Force JackettIO Hostname**   | text      | *(blank)*                                                    | Override hostname in JackettIO URLs                                   |
| **Force JackettIO Port**       | text      | *(blank)*                                                    | Override port in JackettIO URLs                                       |
| **Force JackettIO Protocol**   | text      | *(blank)*                                                    | Override protocol in JackettIO URLs                                   |
| **Stremio-Jackett URL**        | url       | `https://stremio-jackett.elfhosted.com/`                     | Built-in default                                                      |
| **Default Stremio-Jackett's Jackett URL** | url | *(blank)*                                               | URL for Jackett service used by Stremio-Jackett                       |
| **Default Stremio-Jackett's Jackett API Key** | text | *(blank)*                                          | API key for Jackett service                                           |
| **Default Stremio-Jackett TMDB API Key** | text | *(blank)*                                               | TMDB API key for Stremio-Jackett metadata                             |
| **Default Stremio-Jackett Timeout** | number | *(blank)*                                                  | Timeout for Stremio-Jackett requests (ms)                             |
| **StremThru Store URL**        | url       | `https://stremthru.elfhosted.com/stremio/store/`             | Built-in store proxy URL                                              |
| **StremThru Store Timeout**    | number    | `15000`                                                      | Timeout for StremThru store (ms)                                      |
| **Torrentio URL**              | url       | `https://torrentio.strem.fun/`                               | Built-in default                                                      |
| **Default Torrentio Timeout**  | number    | `15000`                                                      | Timeout for Torrentio (ms)                                            |
| **TorBox Stremio URL**         | url       | `https://stremio.torbox.app/`                                | Built-in default                                                      |
| **Default TorBox Stremio Timeout** | number | *(blank)*                                                   | Timeout for TorBox Stremio requests (ms)                              |
| **Peerflix URL**               | url       | `https://peerflix-addon.onrender.com/`                       | Built-in default                                                      |
| **Default Peerflix Timeout**   | number    | `15000`                                                      | Timeout for Peerflix (ms)                                            |
| **Easynews+ URL**              | url       | `https://b89262c192b0-stremio-easynews-addon.baby-beamup.club/` | Built-in default                                                  |
| **Default Easynews+ Timeout**  | number    | `15000`                                                      | Timeout for Easynews+ (ms)                                            |
| **Easynews++ URL**             | url       | `https://easynews-cloudflare-worker.jqrw92fchz.workers.dev/` | Built-in default                                                  |
| **Default Easynews++ Timeout** | number    | `15000`                                                      | Timeout for Easynews++ (ms)                                           |
| **Orion Stremio Addon URL**    | url       | `https://5a0d1888fa64-orion.baby-beamup.club/`               | Built-in default                                                      |
| **Default Orion Timeout**      | number    | `15000`                                                      | Timeout for Orion addon (ms)                                          |
| **Easynews URL**               | url       | `https://ea627ddf0ee7-easynews.baby-beamup.club/`            | Built-in default                                                      |
| **Default Easynews Timeout**   | number    | `15000`                                                      | Timeout for Easynews (ms)                                             |
| **Debridio URL**               | url       | `https://debridio.adobotec.com/`                             | Built-in default                                                      |
| **Default Debridio Timeout**   | number    | `15000`                                                      | Timeout for Debridio (ms)                                             |
| **DMM Cast Timeout**           | number    | `15000`                                                      | Timeout for DMM Cast (ms)                                             |
| **Stremio GDrive Timeout**     | number    | `15000`                                                      | Timeout for Stremio-GDrive (ms)                                       |
