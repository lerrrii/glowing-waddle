# AIOStreams

AIOStreams consolidates multiple Stremio addons and debrid services into a single, easily configurable addon. It allows highly customizable filtering, sorting, and formatting of results, and supports proxying all your streams through MediaFlow Proxy or StremThru for enhanced compatibility and IP restriction bypass.

## Features

- **Unified Interface**: Aggregate results from various addons into a single, streamlined list.
- **Advanced Filtering**: By resolution, quality, visual/audio tags, keywords, and custom regex patterns.
- **Sophisticated Sorting**: Prioritize by quality, size, cached status, seeders, and custom regex rules.
- **Proxy Integration**: Route streams through MediaFlow or StremThru for IP bypass and improved playback.
- **Extensive Limits & Controls**: Set caps on addons, filters, regex patterns, file sizes, and timeouts.
- **Comprehensive Addon Support**: Out-of-the-box configs for Torrentio, MediaFusion, Comet, Jackettio, Stremio-Jackett, StremThru Store, Easynews, Easynews++, Debridio, Peerflix, DMM Cast, Orion, Torbox, and more.

> **Note:** All environment variables are configurable via the Runtipi UI. Deploy then visit `/configure` to tune settings.

## Configuration Reference
Below is a quick reference to all form fields you’ll see in the Runtipi UI, including type, default value, and rationale or example usage.

| Field                       | Type     | Default          | Rationale / Example                                      |
| --------------------------- | -------- | ---------------- | -------------------------------------------------------- |
| **Addon Name**              | text     | `AIOStreams`     | Friendly label; change if you host multiple instances.  |
| **Addon ID**                | text     | `aiostreams.my-domain.com` | Unique DNS-style identifier; must be globally unique.    |
| **Deterministic Addon ID**  | boolean  | `true`           | Ensures predictable IDs across restarts/installations.   |
| **Port**                    | number   | `3000`           | Port where the service listens; matches container port. |
| **Secret Key**              | password | *(empty)*        | 64‑hex string for encryption; auto-generated if left blank.  |
| **API Key**                 | text     | *(empty)*        | Required for regex filters; leave empty for none.       |
| **Show Dice Emoji**         | boolean  | `false`          | Toggle 🎲 icon in results; off by default.               |
| **Log Sensitive Info**      | boolean  | `true`           | Logs API keys/credentials for debugging; can be toggled off. |
| **Default Request Timeout** | number   | `15000` ms       | HTTP/request timeout; adjust if upstream is slow.        |
| **Max Addons**              | number   | `15`             | Limit number of upstream addons to prevent overload.     |
| **Max Keyword Filters**     | number   | `30`             | Limit keyword filters for performance.                   |
| **Max Regex Sort Patterns** | number   | `30`             | Limit regex sort patterns to control complexity.         |
| **Max Movie Size (bytes)**  | number   | `161061273600`   | Movie size cap (150 GiB); adjust if you have larger files. |
| **Max Episode Size (bytes)**| number   | `161061273600`   | Episode size cap; adjust as needed.                      |
| **MediaFlow URL**           | url      | `https://mediafusion.elfhosted.com/` | Default proxy for streams; override if you self-host. |
| **MediaFlow IP Timeout**    | number   | `30000` ms       | Timeout fetching IP from MediaFlow; increase if needed.  |
| **StremThru URL**           | url      | *(empty)*        | Optional proxy; provide URL to enable.                   |
| **StremThru Timeout**       | number   | `30000` ms       | Request timeout for StremThru; same as MediaFlow.        |
| **Torrentio URL**           | url      | `https://torrentio.strem.fun/` | Built-in torrent source; change if forked.         |
| **Additional Addon URLs**   | text     | *(empty)*        | Enter URLs for Easynews, Debridio, Jackettio, etc.       |
```markdown
# AIOStreams

AIOStreams consolidates multiple Stremio addons and debrid services into a single, easily configurable addon. It allows highly customizable filtering, sorting, and formatting of results, and supports proxying all your streams through MediaFlow Proxy or StremThru for enhanced compatibility and IP restriction bypass.

## Features

- **Unified Interface**: Aggregate results from various addons into a single, streamlined list.
- **Advanced Filtering**: By resolution, quality, visual/audio tags, keywords, and custom regex patterns.
- **Sophisticated Sorting**: Prioritize by quality, size, cached status, seeders, and custom regex rules.
- **Proxy Integration**: Route streams through MediaFlow or StremThru for IP bypass and improved playback.
- **Extensive Limits & Controls**: Set caps on addons, filters, regex patterns, file sizes, and timeouts.
- **Comprehensive Addon Support**: Out-of-the-box configs for Torrentio, MediaFusion, Comet, Jackettio, Stremio-Jackett, StremThru Store, Easynews, Easynews++, Debridio, Peerflix, DMM Cast, Orion, Torbox, and more.

> **Note:** All environment variables are configurable via the Runtipi UI. Deploy then visit `/configure` to tune settings.
