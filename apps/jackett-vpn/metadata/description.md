## Jackett (VPN)

![JackettVPN Banner](https://raw.githubusercontent.com/dyonr/jackettvpn/master/banner.png)

**This container runs Jackett behind a VPN tunnel (WireGuard or OpenVPN) with a killswitch.**

| Feature                        | Supported | Notes                             |
|--------------------------------|-----------|-----------------------------------|
| WireGuard                      | Yes       | Place `wg0.conf` in `/config/wireguard` |
| OpenVPN                        | Yes       | Place `.ovpn` files in `/config/openvpn` |
| VPN Killswitch (iptables)      | Yes       | Prevents leaks when VPN drops    |
| Custom UID/GID                 | Yes       | Via `PUID`/`PGID` env vars       |
| Jackett WebUI Password         | Yes       | `WEBUI_PASSWORD` env var         |

## Usage

This container requires at least one of WireGuard or OpenVPN configs under `/config`:

- **WireGuard**: drop `wg0.conf` in `/config/wireguard/`
- **OpenVPN**: drop your `.ovpn` and any certs in `/config/openvpn/`

Then mount your download or blackhole directory to `/blackhole`.

## Documentation

- [dyonr/jackettvpn on Docker Hub](https://hub.docker.com/r/dyonr/jackettvpn)
- [GitHub Repository](https://github.com/dyonr/jackettvpn)
