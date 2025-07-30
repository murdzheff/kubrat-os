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
  gcc-c++
  make
  cmake
  autoconf
  automake
  libtool
  pkgconf-devel
)

for package in "${packages[@]}"; do
  dnf install -y "$package"
done







# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:


#### Example for enabling a System Unit File

systemctl enable podman.socket
