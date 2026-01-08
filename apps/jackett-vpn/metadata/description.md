# Jackett VPN

Jackett works as a proxy server: it translates queries from apps into tracker-site-specific http queries, parses the html response, and then sends results back. This implementation runs behind Gluetun VPN for privacy and security.

## Features
* Jackett torrent proxy running behind secure VPN connection
* Support for multiple VPN providers 
* Multiple countries selection for VPN connection
* Enhanced firewall security
* DNS leak protection
* Works with traefik!
* Pre-configured for Tipi

## Why Use a VPN with Jackett?
A VPN provides privacy and security when accessing torrent trackers:
1. Hides your IP address from trackers
2. Encrypts your internet traffic
3. Prevents ISP monitoring and potential throttling
4. Works around regional blocking for trackers

## Configuration Options

There are two ways to configure this application:

### Option 1: Standard VPN Provider (Automatic Configuration)

Use this option if you have an account with a supported VPN provider.

**Supported Providers:**
- ProtonVPN (WireGuard or OpenVPN)
- Mullvad (WireGuard or OpenVPN)
- NordVPN (WireGuard or OpenVPN)
- PIA (Private Internet Access) (WireGuard or OpenVPN)
- Surfshark (WireGuard or OpenVPN)
- IVPN (WireGuard or OpenVPN)
- Windscribe (WireGuard or OpenVPN)

**Required Configuration:**

1. **VPN > Service Provider**: Select your VPN provider from the dropdown
2. **VPN > Type**: Choose either `WireGuard` (recommended) or `OpenVPN`

**For WireGuard:**
- **VPN > WireGuard Private Key**: Enter your WireGuard private key (obtain this from your VPN provider's dashboard)
- **VPN > Server Countries**: Enter comma-separated country names (e.g., `Netherlands,United States,Japan`)

**For OpenVPN:**
- **VPN > OpenVPN Username**: Your VPN account username
- **VPN > OpenVPN Password**: Your VPN account password
- **VPN > Server Countries**: Enter comma-separated country names (e.g., `Netherlands,United States,Japan`)

**ProtonVPN Specific:**
- **VPN > Free Only**: Enable this if you want to use only free ProtonVPN servers (requires free account)

---

### Option 2: Custom Static Server Configuration

Use this option if you have a specific WireGuard server you want to connect to, or if your provider isn't listed above.

**Required Configuration:**

1. **VPN > Service Provider**: Select `Custom (Static Server)`
2. **VPN > Type**: Select `WireGuard`
3. **VPN > WireGuard Private Key**: Your WireGuard private key
4. **VPN > Custom > Server Endpoint IP**: The IP address of your WireGuard server (e.g., `1.2.3.4`)
5. **VPN > Custom > Server Endpoint Port**: The port of your WireGuard server (typically `51820`)
6. **VPN > Custom > Server Public Key**: Your WireGuard server's public key
7. **VPN > Custom > WireGuard Addresses**: Your VPN IP address with CIDR notation (e.g., `10.2.0.2/32`)
8. **VPN > Custom > Pre-Shared Key (Optional)**: Optional pre-shared key for additional security

**Note:** When using Custom configuration, leave the "VPN > Server Countries" field empty as it's not used.

---

## Optional Configuration Settings

These settings apply to both configuration options:

**Container Settings:**
- **Container > UserID (UID)**: Default `1000`
- **Container > GroupID (PGID)**: Default `1000`

**VPN Advanced:**
- **VPN > Enable Port Forwarding**: Enable if your VPN provider supports port forwarding (check provider documentation)
- **VPN > WireGuard MTU**: Maximum Transmission Unit size (default `1320` - recommended to leave as default unless experiencing connection issues)

**Security:** *(Recommended: Enable all)*
- **Security > Enable Firewall**: ✅ **Strongly recommended** - Keep enabled for maximum security (default `true`)
- **Security > Enable DNS over TLS**: ✅ **Recommended** - Encrypts DNS queries to prevent DNS leaks and snooping

**DNS Filtering:** *(Recommended: Enable all)*
- **DNS-over-TLS > Enable IPv6**: Enable IPv6 for DNS-over-TLS (optional, only if your network supports IPv6)
- **DNS Filtering > Block malicious**: ✅ **Recommended** - Blocks known malicious domains and protects against threats
- **DNS Filtering > Block ads**: ✅ **Recommended** - Blocks advertising domains for cleaner browsing
- **DNS Filtering > Block surveillance**: ✅ **Recommended** - Blocks surveillance and tracking domains for enhanced privacy
- **DNS Filtering > Update period**: Default `24h` (recommended to keep at default)

## Recommended Security Configuration

For maximum privacy and security when using Jackett, we recommend enabling:

1. **Firewall**: Always keep enabled
2. **DNS over TLS**: Prevents DNS leaks
3. **Block malicious**: Protection against malicious sites
4. **Block ads**: Reduces tracking and improves performance
5. **Block surveillance**: Enhances privacy by blocking tracking domains

These settings work together to create multiple layers of protection for your torrent proxy traffic.

## Documentation
For advanced configuration options, please refer to:
- Gluetun documentation: https://github.com/qdm12/gluetun-wiki
- Jackett documentation: https://github.com/Jackett/Jackett

## Folder Information
| Root Folder | Container Folder |
|-------------|------------------|
| /runtipi/app-data/jackett-vpn/data/config | /config |
| /runtipi/app-data/jackett-vpn/data/downloads | /downloads |
| /runtipi/app-data/jackett-vpn/data/gluetun | /gluetun |
