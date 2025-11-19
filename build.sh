#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:

#!/bin/bash

# Define the package manager command (use 'dnf5' for uBlue/etc., or 'dnf' for standard Fedora)
PACKAGE_MANAGER="dnf5" 


# 'cinnamon-screensaver' for locking the screen.
$PACKAGE_MANAGER install \
    cinnamon \
    cinnamon-control-center \
    nemo \
    cinnamon-screensaver \
    @base-x \
    gnome-terminal \
    firefox \
    xdg-user-dirs-gtk \
    bash-completion \
    gstreamer1-plugins-base \
    polkit \
    -y

# 2. Install essential utilities for a smooth experience
echo "Installing essential utilities..."
$PACKAGE_MANAGER install \
    gnome-terminal \
    -y




echo "Checking and setting the graphical target (using existing display manager)..."

systemctl set-default graphical.target





curl -s -o /etc/yum.repos.d/tailscale.repo https://pkgs.tailscale.com/stable/centos/9/tailscale.repo


packages=(
   tailscale
   helix
   greetd
   zsh
   fastfetch
)

for package in "${packages[@]}"; do
  dnf5 install -y "$package"
done





# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:


#### Example for enabling a System Unit File
systemctl enable lightdm.service
systemctl enable podman.socket
