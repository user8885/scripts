#!/usr/bin/env bash

[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc~
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile~
[ -f ~/.profile ] && mv ~/.profile ~/.profile~
[ -d ~/.config ] && mv ~/.config ~/.config~
mkdir ~/.config

mkdir -p ~/Downloads/git
cd ~/Downloads/git
sudo pacman --noconfirm -Syyu git stow
git clone https://github.com/user8885/dotfiles
cd dotfiles && stow .

[ -d ~/.local/bin ] && mv ~/.local/bin ~/.local/bin~
mkdir ~/.local
ln -sf ~/scripts/bin ~/.local/bin

sudo pacman --noconfirm -S pipewire pipewire-pulse pipewire-jack wireplumber pulsemixer
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber

sudo pacman -S --needed base-devel
cd ~/Downloads/git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

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

sudo bash -c "echo -e \"\n[user8885-arch-repo]\nSigLevel = Optional DatabaseOptional\nServer = https://github.com/user8885/\x24repo/raw/refs/heads/main/os/\x24arch\" >> /etc/pacman.conf"

sudo pacman -S --noconfirm shell-color-scripts dracula-theme-user8885-git

sudo bash -c "echo -e \"\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\" >> /etc/pacman.conf"

sudo pacman -Syyu --noconfirm wine-staging
sudo pacman -S --noconfirm --needed --asdeps giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse \
lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite \
lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2


echo -e "\n\nChoose the vulkan lib for your gpu..." > /tmp/wayland-wms.sh~Driver-noti~
echo -e "\nAMD should use - vulkan-radeon && lib32-vulkan-radeon" >> /tmp/wayland-wms.sh~Driver-noti~
echo -e "\nIntel should use - vulkan-intel && lib32-vulkan-intel" >> /tmp/wayland-wms.sh~Driver-noti~
echo -e "\nFor Nvidia see the arch wiki page to install your drivers :|" >> /tmp/wayland-wms.sh~Driver-noti~
echo -e "https://wiki.archlinux.org/title/NVIDIA" >> /tmp/wayland-wms.sh~Driver-noti~
echo -e "\nBut if you have Nvidia GTX 16xx+ (i think) then you should be able to use -" >> /tmp/wayland-wms.sh~Driver-noti~
echo -e "nvidia-utils && lib32-nvidia-utils - and then afterwards, install nvidia-open or nvidia-open-lts" >> /tmp/wayland-wms.sh~Driver-noti~
less /tmp/wayland-wms.sh~Driver-noti~

sudo pacman -S --needed steam lutris gamescope gamemode mangohud

echo -e "\n\n\nYay, you're done installing stuff, now reboot... or-else..."
