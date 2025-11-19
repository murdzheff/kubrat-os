#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:

#!/bin/bash

# Define the package manager command (use 'dnf5' for uBlue/etc., or 'dnf' for standard Fedora)
PACKAGE_MANAGER="dnf5" 

# Check if the package manager is available
if ! command -v "$PACKAGE_MANAGER" &> /dev/null; then
    echo "Error: '$PACKAGE_MANAGER' command not found. Please verify the correct package manager."
    exit 1
fi

echo "Starting manual installation of Cinnamon Desktop Environment..."
echo "Using package manager: $PACKAGE_MANAGER"
echo "---"

# 1. Install the main Cinnamon package and its core components
# 'cinnamon' is the desktop shell.
# '@base-x' is the necessary group for the Xorg server and minimal graphical dependencies.
# 'cinnamon-control-center' is for the settings GUI.
# 'nemo' is the default file manager.
# 'gnome-terminal' (or similar) is a recommended terminal emulator.
# 'cinnamon-screensaver' for locking the screen.
$PACKAGE_MANAGER install \
    cinnamon \
    cinnamon-control-center \
    nemo \
    cinnamon-screensaver \
    @base-x \
    -y

# 2. Install essential utilities for a smooth experience
echo "Installing essential utilities..."
$PACKAGE_MANAGER install \
    gnome-terminal \
    -y

# 3. Ensure the Display Manager (DM) service is enabled
# NOTE: This assumes you already have GDM (GNOME Display Manager) installed 
# and enabled. We are NOT enabling LightDM here.
echo "Checking and setting the graphical target (using existing display manager)..."
systemctl set-default graphical.target

echo "---"
echo "Cinnamon Desktop Environment installed successfully."
echo "If this script is part of a container build (like ostree), ensure the final"
echo "container commit step is reached."
echo "For a live system, a reboot or logout is required."
echo "Remember to select the 'Cinnamon' session at the login screen."



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




dnf5 -y copr enable avengemedia/danklinux
dnf5 -y install dms-greeter
dnf5 -y copr enable avengemedia/dms
dnf5 -y install dms


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:


#### Example for enabling a System Unit File

systemctl enable podman.socket
