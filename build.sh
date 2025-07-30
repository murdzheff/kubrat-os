#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:



packages=(
  tmux
  curl
  gcc
  xfreerdp
  syncthing
  git
  helix
)

for package in "${packages[@]}"; do
  dnf install -y "$package"
done


#install iosevka
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Iosevka.zip -o /tmp/Iosevka.zip
unzip /tmp/Iosevka.zip -d /usr/share/fonts/
fc-cache -vf
# Cloner le repository
git clone https://github.com/Mounik/omarchy-fedora
cd omarchy-fedora

# Rendre le script exécutable
chmod +x install.sh

# Lancer l'installation (avec sudo)
sudo ./install.sh




# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:


#### Example for enabling a System Unit File

systemctl enable podman.socket
