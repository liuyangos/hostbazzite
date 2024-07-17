#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl -Lo /etc/yum.repos.d/_copr_liuyangos-bazzite.repo https://copr.fedorainfracloud.org/coprs/liuyangos/bazzite/repo/fedora-40/kylegospo-bazzite-fedora-40.repo

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen

#sudo -A ujust add-user-to-input-group
#sudo -A ujust enable-deck-bios-firmware-updates
#sudo -A ujust setup-decky install
#sudo -A ujust configure-grub hide
#ujust install-gamemode-video
#ujust fix-steam-download-speed
#ujust install-steamcmd

rpm-ostree override replace \
    --experimental \
    --from repo=copr:copr.fedorainfracloud.org:liuyangos:bazzite \
        jupiter-hw-support-btrfs \
        steamdeck-kde-presets

sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_liuyangos-bazzite.repo

ls -l /usr/share/plymouth/themes/steamos/bazzite.png
md5sum /usr/share/plymouth/themes/steamos/bazzite.png

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
