#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
curl -s -o /etc/yum.repos.d/tailscale.repo https://pkgs.tailscale.com/stable/centos/9/tailscale.repo


dnf install @development-tools -y


packages=(
  tmux
  tailscale
  curl
  gcc
  xfreerdp
  rofi-wayland
  kitty
  xdg-desktop-portal-hyprland
  waybar
  xorg-x11-server-Xwayland
  headsetcontrol
  polkit
  xfce-polkit
  xdg-user-dirs
  dbus-tools
  dbus-daemon
  wl-clipboard
  pavucontrol
  playerctl
  qt5-qtwayland
  qt6-qtwayland
  vulkan-validation-layers
  vulkan-tools
  google-noto-emoji-fonts
  gnome-disk-utility
  ddcutil
  openssl
  vim
  just
  alsa-firmware
  p7zip
  distrobox
  dunst
  lxappearance
  gvfs-smb
  smbclient
  wireplumber
  pipewire
  pamixer
  pulseaudio-utils
  NetworkManager-openvpn
  NetworkManager-openvpn-gnome
  NetworkManager-openconnect
  NetworkManager-openconnect-gnome
  bluez
  bluez-tools
  blueman
  firewall-config
  thunar
  thunar-archive-plugin 
  thunar-volman
  xarchiver
  imv
  p7zip
  gvfs-mtp
  gvfs-gphoto2
  gvfs-smb
  gvfs-nfs
  gvfs-fuse
  gvfs-archive
  android-tools
  slurp
  grim
  wlr-randr
  brightnessctl
  kanshi
  fontawesome-fonts-all
  syncthing
  helix
  gnome-themes-extra
  gnome-icon-theme
  paper-icon-theme
  breeze-icon-theme 
)

for package in "${packages[@]}"; do
  dnf install -y "$package"
done


#install iosevka
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Iosevka.zip -o /tmp/Iosevka.zip
unzip /tmp/Iosevka.zip -d /usr/share/fonts/
fc-cache -vf



cp -r /tmp/.config /etc/custom-configs





#scp -r /etc/skel/.config/* /etc/xdg/
#scp -r /etc/skel/.config/hypr/hyprland.conf /usr/share/hyprland/


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:


#### Example for enabling a System Unit File

systemctl enable podman.socket
