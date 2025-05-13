## Jackett + VPN (WireGuard/OpenVPN)

This flavor of Jackett runs entirely over a WireGuard or OpenVPN tunnel, enforcing a true kernel-level VPN kill-switch. All DNS and torrent tracker queries from Jackett will go through the VPN interface; if the tunnel drops, traffic will be blocked.

![Screenshot](https://raw.githubusercontent.com/Jackett/Jackett/master/.github/jackett-screenshot1.png)

## Setup Instructions

### For WireGuard
1. Create a WireGuard configuration file named `wg0.conf`
2. Place this file in `/runtipi/app-data/jackett-vpn/data/wireguard/`
3. Make sure VPN Type is set to "wireguard" in the app settings

### For OpenVPN
1. Place your `.ovpn` configuration file in `/runtipi/app-data/jackett-vpn/data/openvpn/`
2. Set VPN Type to "openvpn" in the app settings
3. Enter your VPN username and password in the app settings

## Features
- Automatic kill-switch prevents IP leaks if VPN disconnects
- Works with most VPN providers supporting WireGuard or OpenVPN
- Easy setup with form-based configuration
- All torrent queries safely routed through VPN

## Folder Info

| Root Folder                              | Container Folder |
|------------------------------------------|------------------|
| /runtipi/app-data/jackett-vpn/data       | /config          |
| /runtipi/app-data/jackett-vpn/data/wireguard | /config/wireguard |
| /runtipi/app-data/jackett-vpn/data/openvpn  | /config/openvpn |
| /runtipi/media/torrents                  | /blackhole       |
