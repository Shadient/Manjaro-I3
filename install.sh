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
  'gtop'
  'htop'
  'kate'
  'less'
  'man-db'
  'meson'
  'neofetch'
  'neovim'
  'networkmanager'
  'obsidian'
  'okular'
  'pavucontrol'
  'pulseaudio'
  'python-pip'
  'qbittorrent'
  'redshift'
  'ripgrep'
  'rust'
  'tectonic'
  'telegram-desktop'
  'thunar'
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
