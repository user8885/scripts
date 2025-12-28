#!/usr/bin/env bash

cd ~
sudo pacman -S stow
git clone https://github.com/user8885/dotfiles
cd dotfiles && stow .
cd ~

mkdir ~/.local
ln -sf ~/scripts/bin ~/.local/bin

sudo pacman -S pipewire pipewire-pulse wireplumber pulsemixer
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber

sudo pacman -S --needed git base-devel
mkdir -p ~/Downloads
cd ~/Downloads
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..
rm -rf paru-bin
cd ~

sudo pacman --needed -S \
    timeshift grub-btrfs inotify-tools btrfs-progs \
    hyprland xdg-desktop-portal-hyprland \
    sway xdg-desktop-portal-wlr \
    niri xdg-desktop-portal-gnome xwayland-satellite \
    swaybg swaylock rofi-wayland \
    network-manager-applet blueman polkit-gnome \
    nwg-look qt6ct kvantum \
    ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-ubuntu-font-family \
    flatpak xdg-desktop-portal xdg-desktop-portal-gtk \
    ghostty mpv qbittorrent imv yazi btop eza fastfetch zoxide \
    xorg-xhost wev curl wget 

paru -S floorp-bin neovim-git

flatpak install flathub org.gnome.Boxes \
    com.spotify.Client \
    com.github.tchx84.Flatseal \
    io.github.flattool.Warehouse \
    com.vysp3r.ProtonPlus

cd ~/Dowloads
git clone https://github.com/user8885/dracula-theme-user8885
cd dracula-theme-user8885
makepkg -si
cd..
rm -rf dracula-theme-user8885
cd ~

mkdir -p ~/Pictures/wallpapers
cd ~/Picture/wallpapers
git clone https://github.com/w3dg/wallpapers
cd ~

echo -e "Opening /etc/pacman.conf in neovim with superuser privliges \nGo to the bottom and uncomment the mulitlib repo" | less && \
  EDITOR=nvim sudoedit /etc/pacman.conf

sudo pacman -Sy wine-staging
sudo pacman -S --needed --asdeps giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse \
lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite \
lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2

sudo pacman -S steam lutris gamescope gamemode mangohud

echo "Maybe restart because so much shit was installed" > ~noti.tmp~ && \
echo "But im not your dad, so do what you want" >> ~noti.tmp~ && \
echo "type 'hyprland' to launch hyprland... uHdUh" >> ~noti.tmp~ && \
echo "or type 'sway' ..." >> ~noti.tmp~ && \
echo "or type 'niri --session' yeah its written in rust so you know its 'special'" >> ~noti.tmp~ && \
echo -e "\n\n" >> ~noti.tmp~ && \
echo "This file will be deleted after you close deleted SO READ IT" >> ~noti.tmp~ && \
echo "Oh yeah to close press 'q'" >> ~noti.tmp~ && \
less ~noti.tmp~
rm ~noti.tmp~

bash
