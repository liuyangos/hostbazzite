#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen

ls -l /etc/yum.repos.d/
cat /etc/yum.repos.d/_copr_kylegospo-bazzite.repo
echo "=========vjligi========"
cat /etc/yum.repos.d/_copr_matte-schwartz-sunshine.repo

sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_kylegospo-bazzite.repo && \

# Install override logo
rpm-ostree install \
        jupiter-hw-support \
        steamdeck-kde-presets

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
