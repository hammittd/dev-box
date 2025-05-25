#cloud-config
package_update: true
package_upgrade: true
packages:
- curl
- git

runcmd:
- curl -sfL https://get.k3s.io | sh -
- curl -fsSL https://tailscale.com/install.sh | sh
- tailscale up --authkey=${tailscale_auth_key} --hostname=devbox
