#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING SOFTWARE"
echo

sudo pacman -Sy

PKGS=(
  'alacritty'
  'base-devel'
  'blender'
  'brightnessctl'
  'btop'
  'cmatrix'
  'curl'
  'discord'
  'firefox'
  'flameshot'
  'git'
  'gparted'
  
  # gparted optional dependencies
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
  'less'
  'linux419-virtualbox-host-modules'
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
  'ripgrep'
  'rust'
  'tectonic'
  'telegram-desktop'
  'thunar'
  'virtualbox'
  'vlc'
  'wget'
  'zathura'
)

for PKG in "${PKGS[@]}"; do
  echo "INSTALLING: ${PKG}"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo 'INSTALLING AUR PACKAGES'
echo

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~

paru -S librewolf-bin
paru -S vscodium-bin
paru -S etcher-bin

echo
echo "Done!"
echo
