# Jackett VPN

Docker container which runs the latest headless [Jackett](https://github.com/Jackett/Jackett) server while connecting to WireGuard or OpenVPN with an iptables killswitch to prevent IP leakage when the tunnel goes down.

![Jackett VPN Banner](https://raw.githubusercontent.com/dyonr/jackettvpn/main/banner_641x91.gif)

**Features**
- **VPN Support**: WireGuard or OpenVPN tunnel
- **Killswitch**: Prevents traffic leak if VPN drops
- **Configurable**: Custom PUID/PGID, UMASK, DNS, healthchecks
- **WebUI**: Jackett's API and web interface with password protection
- **Auto Healthcheck**: Interval-based connectivity tests

**Documentation**
- GitHub: https://github.com/dyonr/jackettvpn
- Docker Hub: https://hub.docker.com/r/dyonr/jackettvpn

**Usage example**:
```bash
$ docker run --privileged -d \
    -v /your/config/path/:/config \
    -v /your/blackhole/path/:/blackhole \
    -e VPN_ENABLED=yes \
    -e VPN_TYPE=wireguard \
    -e WEBUI_PASSWORD=your_password \
    -e LAN_NETWORK=192.168.0.0/24 \
    -p 9117:9117 \
    --restart unless-stopped \
    dyonr/jackettvpn
