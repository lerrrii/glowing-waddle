## Jackett + ProtonVPN WireGuard

This flavor of Jackett runs entirely over a WireGuard tunnel to ProtonVPN,  
enforcing a true kernel-level VPN kill-switch. All DNS and torrent tracker  
queries from Jackett will go through the WireGuard interface; if the tunnel  
drops, traffic will be blocked.

![Screenshot](https://raw.githubusercontent.com/Jackett/Jackett/master/.github/jackett-screenshot1.png)

## Folder Info

| Root Folder                       | Container Folder |
|-----------------------------------|------------------|
| /runtipi/app-data/jackett/data    | /config          |
| /runtipi/app-data/wireguard       | /config          |
| /runtipi/media/torrents           | /media/torrents  |
