#!/usr/bin/env bash

#-------------------------------------------------------------------------
# DEPENDENCIES
#-------------------------------------------------------------------------

echo
echo "INSTALLING DEPENDENCIES"
echo

cd ~
sudo pacman -Sy

PKGSAUR=(
  'base-devel'
  'curl'
  'git'
  'less'
  'ripgrep'
)

for PKGAUR in "${PKGSAUR[@]}"; do
  echo "INSTALLING: ${PKGAUR}"
  sudo pacman -S "$PKGAUR" --needed
done

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts
source ~/.bashrc

#-------------------------------------------------------------------------
# SYSTEM UPDATE
#-------------------------------------------------------------------------

echo
echo "SYSTEM UPDATE"
echo

sudo pacman -Syu
source ~/.bashrc

#-------------------------------------------------------------------------
# INSTALLING PACKAGES
#-------------------------------------------------------------------------

echo
echo "INSTALLING PACKAGES"
echo

PKGS=(
  'alacritty'
  'blender'
  'brightnessctl'
  'btop'
  'cmatrix'  
  'discord'
  'flameshot'
  'git'
  'gparted'
  
  # -- gparted optional dependencies --
  'btrfs-progs'   # for btrfs partitions
  'dosfstools'    # for FAT16 and FAT32 partitions
  'exfatprogs'    # for exFAT partitions
  'f2fs-tools'    # Flash-Friendly File System
  'gpart'         # for recovering corrupt partiton tables
  'jfsutils'      # for jfs partitions
  'mtools'        # utilities to access MS-DOS disks
  'nilfs-utils'   # for nilfs2 support
  'ntfs-3g'       # for ntfs partitions
  'reiserfsprogs' # for reiser partitions
  'udftools'      # for UDF file system support
  'xfsprogs'      # for xfs partitions
  
  'gtop'
  'htop'
  'kate'
  # 'linux419-virtualbox-host-modules'
  'man-db'
  'meson'
  'neofetch'
  'neovim'
  'networkmanager'
  'obsidian'
  'okular'
  'pavucontrol'
  'polkit'
  'pulseaudio'
  'python-pip'
  'qbittorrent'
  'redshift'
  'rust'
  'tectonic'
  'telegram-desktop'
  'thunar'
  # 'virtualbox'
  'vlc'
  'wget'
  'zathura'

  # Web Browsers
  'firefox'
  'opera'
  'vivaldi'
)

for PKG in "${PKGS[@]}"; do
  echo "INSTALLING: ${PKG}"
  sudo pacman -S "$PKG" --needed
done

source ~/.bashrc

#-------------------------------------------------------------------------
# AUR PACKAGES
#-------------------------------------------------------------------------

echo
echo 'INSTALLING AUR PACKAGES'
echo

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~
source ~/.bashrc

paru -S etcher-bin
paru -S librewolf-bin
paru -S vscodium-bin
paru -S waterfox-bin

#-------------------------------------------------------------------------
# ADDITIONAL
#-------------------------------------------------------------------------

echo
echo "Done!"
echo


