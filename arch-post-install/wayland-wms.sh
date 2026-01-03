#!/usr/bin/env bash

[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc~
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile~
[ -f ~/.profile ] && mv ~/.profile ~/.profile~
[ -d ~/.config ] && mv ~/.config ~/.config~
mkdir ~/.config

cd ~
sudo pacman --noconfirm -Syyu git stow
git clone https://github.com/user8885/dotfiles
cd dotfiles && stow .
cd ~

[ -d ~/.local/bin ] && mv ~/.local/bin ~/.local/bin~
mkdir ~/.local
ln -sf ~/scripts/bin ~/.local/bin

sudo pacman --noconfirm -S pipewire pipewire-pulse pipewire-jack wireplumber pulsemixer
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber

sudo pacman -S --needed base-devel
mkdir -p ~/Downloads
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
cd ~

sudo pacman --needed --noconfirm -S \
    timeshift grub-btrfs inotify-tools btrfs-progs \
    hyprland xdg-desktop-portal-hyprland \
    niri xdg-desktop-portal-gnome xwayland-satellite \
    lxqt labwc xorg \
    swaybg swaylock swaync swayosd rofi-wayland wlsunset \
    network-manager-applet blueman polkit-gnome \
    nwg-look qt6ct kvantum xcursor-vanilla-dmz-aa \
    noto-fonts ttf-noto-nerd ttf-jetbrains-mono-nerd \
    flatpak xdg-desktop-portal-gtk \
    keepassxc qbittorrent ghostty mpv imv yazi btop eza fastfetch zoxide starship \
    xorg-xhost wev wget pulsemixer less man-db bash-completion xclip wl-clipboard

# Some additional fonts
# sudo pacman --needed --noconfirm -S ttf-jetbrains-mono ttf-ubuntu-font-family

sudo systemctl enable --now cronie.service
sudo systemctl enable --now bluetooth.service

paru -S floorp-bin 
paru -S neovim-git 
paru -S mullvad-vpn-bin

flatpak install --noninteractive flathub \
    org.gnome.Boxes \
    com.spotify.Client \
    com.github.tchx84.Flatseal \
    io.github.flattool.Warehouse \
    com.vysp3r.ProtonPlus

cd ~
git clone https://github.com/user8885/dracula-theme-user8885
cd dracula-theme-user8885
makepkg -si
cd..
rm -rf dracula-theme-user8885
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
makepkg -si
cd ..
rm -rf shell-color-scripts
cd ~

mkdir -p ~/Pictures/wallpapers
cd ~/Pictures/wallpapers
git clone https://github.com/user8885/wallpapers.git
cd ~

sudo bash -c "echo -e \"\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\" >> /etc/pacman.conf"


sudo pacman -Syyu --noconfirm wine-staging
sudo pacman -S --noconfirm --needed --asdeps giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse \
lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite \
lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2


echo -e "\n\nChoose the vulkan lib for your gpu..."
echo -e "\nAMD should use - vulkan-radeon && lib32-vulkan-radeon"
echo -e "\nIntel should use - vulkan-intel && lib32-vulkin-intel"
echo -e "\nFor Nvidia see the arch wiki page to install your drivers :|"
echo -e "https://wiki.archlinux.org/title/NVIDIA"
echo -e "\nBut if you have Nvidia GTX 16xx+ (i think) then you should be able to use -"
echo -e "nvidia-utils && lib32-nvidia-utils - and then after install install nvidia-open or nvidia-open-lts"
sleep 3
sudo pacman -S --needed steam lutris gamescope gamemode mangohud

echo -e "\n\n\nYay, you're done installing stuff, now reboot... or-else..."
