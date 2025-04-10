#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
curl -s -o /etc/yum.repos.d/tailscale.repo https://pkgs.tailscale.com/stable/centos/9/tailscale.repo
#dnf copr enable peterwu/iosevka
dnf5 -y copr enable solopasha/hyprland


# this installs a package from fedora repos
dnf install -y tmux tailscale curl \
 xfreerdp xfce4-docklike-plugin ulauncher hp-plugin hyprland hyprpaper hyprlock \
 rofi kitty thunar xdg-desktop-portal-hyprland waybar nwg-look hyprsunset hyprpicker \
 hyprpanel hyprcursor hyprpolkitagent hyprland-autoname-workspaces hyprshot nwg-clipman dunst lxappearance \
 gvfs-smb  smbclient
#install iosevka
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Iosevka.zip -o /tmp/Iosevka.zip
unzip /tmp/Iosevka.zip -d /usr/share/fonts/
fc-cache -vf




#scp -r /etc/skel/.config/* /etc/xdg/
#scp -r /etc/skel/.config/hypr/hyprland.conf /usr/share/hyprland/


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
dnf5 -y copr disable solopasha/hyprland

#### Example for enabling a System Unit File

systemctl enable podman.socket
