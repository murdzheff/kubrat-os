#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:

curl -s -o /etc/yum.repos.d/tailscale.repo https://pkgs.tailscale.com/stable/centos/9/tailscale.repo



packages=(
  tmux
  curl
  tailscale
  gcc
  xfreerdp
  NetworkManager-tui
  kitty
  syncthing
  git
  niri
  helix
  nautilus
)

for package in "${packages[@]}"; do
  dnf install -y "$package"
done

dnf remove -y thunar*







# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:


#### Example for enabling a System Unit File

systemctl enable podman.socket
