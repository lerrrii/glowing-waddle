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

## VPN Provider Configuration
This container is configured to work with several popular VPN providers:

| VPN Provider | WireGuard Support | OpenVPN Support |
|--------------|-------------------|-----------------| 
| ProtonVPN    | ✅                | ✅              |
| Mullvad      | ✅                | ✅              |
| NordVPN      | ✅                | ✅              |
| PIA          | ✅                | ✅              |
| Surfshark    | ✅                | ✅              |
| IVPN         | ✅                | ✅              |
| Windscribe   | ✅                | ✅              |

## WireGuard Setup (Recommended)
For WireGuard configurations:
1. Generate a private key from your VPN provider
2. Enter the private key in the configuration form
3. Choose your preferred server countries (comma-separated)

## Enhanced Security Features

This Jackett-VPN package includes several security enhancements:

### DNS Protection
When enabled, this ensures all DNS queries are sent through encrypted DNS-over-TLS to prevent DNS leaks.

### Ad Blocking
Optional DNS-level ad blocking that filters requests to known advertising domains. This can help reduce ads without requiring browser extensions.

### Surveillance Blocking
Optional DNS-level filtering that blocks requests to known tracking and telemetry services, enhancing your privacy while browsing.

### Firewall Protection
Enables a strict firewall that only allows traffic through the VPN tunnel, preventing any accidental leaks of your real IP address.

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
