(Card) Forge for private (remote) use
=====================================

Forge for personal/private use (rdesktop)

## Usage instructions

```shell
$ podman run -d --name cardforge -p 8444:8444 \
   ghcr.io/gbraad-gaming/cardforge:latest
$ podman exec -it cardforge su - gbraad
$ kasmvncserver
```

This allows you to open the remote session from your IP, like
`https://[remote_ip]:8444`. 

Otherwise, you can use tailscale to allow remote use:

```shell
$ sudo systemctl enable --now tailscaled
$ sudo tailscale up
$ tailscale ip
```

... and then open `https://[tailscale_ip]:8444`

