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
rpm-ostree install screen firefox firefox-langpacks

#rpm-ostree override remove hhd hhd-ui

cp "/usr/share/ublue-os/firstboot/yafti.yml" "/usr/etc/yafti.yml"
rm "/usr/share/ublue-os/bazzite/bazzite-suspend.webm"
rm -f "/usr/share/applications/Documentation.desktop" "/usr/share/applications/bazzite-documentation.desktop"
#rm "/usr/bin/bazzite-steam"
#rm "/usr/etc/xdg/autostart/steam.desktop"
#rm "/usr/lib/systemd/system/return-to-gamemode.service"
#rm "/usr/bin/return-to-gamemode"

#sed -i 's|^HOME_URL=.*|HOME_URL="https://hos4.com"|' /usr/lib/os-release && \

rpm-ostree override replace \
    --experimental \
    --from repo=copr:copr.fedorainfracloud.org:liuyangos:bazzite \
        jupiter-hw-support-btrfs \
        steamdeck-kde-presets \
        hhd \
        hhd-ui

sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_liuyangos-bazzite.repo

#sudo -A ujust add-user-to-input-group
#sudo -A ujust enable-deck-bios-firmware-updates
#sudo -A ujust setup-decky install
#sudo -A ujust configure-grub hide
#ujust install-gamemode-video
#ujust fix-steam-download-speed
#ujust install-steamcmd


#ujust setup-decky install
#ujust setup-decky simpledeckytdp

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
