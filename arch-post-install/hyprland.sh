#!/usr/bin/env bash

# (Display) Login Manager(s)

# SDDM
# sudo pacman -S sddm && sudo systemctl enable sddm


# Audio (pipewire)
sudo pacman -S pipewire pipewire-pulse wireplumber pulsemixer
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber


# Hyprland
sudo pacman -S hyprland hyprpaper hyprlock xdg-desktop-portal-hyprland rofi kitty network-manager-applet xwaylandvideobridge polkit-gnome xorg-host


# AUR HELPER
sudo pacman -S --needed git base-devel
mkdir -p ~/Downloads/git
cd ~/Downloads/git
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ~

# Web browser(s)

# FIREFOX
# sudo pacman -S firefox

# BRAVE
# paru -S brave-bin # pre-comiled
# paru -S brave # will compile during install

# supierior font
sudo pacman -S ttf-ubuntu-font-family


# THEMEING
sudo pacman -S nwg-look qt6ct kvantum
cd ~/Downloads/git

# Colloid-gtk-theme
git clone https://github.com/vinceliuice/Colloid-gtk-theme && \
  cd Colloid-gtk-theme && ./install.sh --tweaks dracula -c dark -t purple pink green && cd ..

# Best circle icons
git clone https://github.com/vinceliuice/Tela-circle-icon-theme && \
  cd Tela-circle-icon-theme && ./install.sh -c dracula
cd ~


# basic wallpapers
cd ~/Downloads/git
git clone https://github.com/w3dg/wallpapers
mkdir -p ~/.local/share/backgrounds
mv wallpapers/* ~/.local/share/backgrounds/
rm -r wallpapers
cd ~

# Flatpak
sudo pacman -S flatpak xdg-desktop-portal xdg-desktop-portal-gtk
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub io.github.flattool.Warehouse

# Games

sudo pacman -S --needed less neovim
# Enable mulitlib repos for wine
echo "Opening /etc/pacman.conf in neovim with superuser privliges" && \
  echo -n "Go to the bottom and uncomment the mulitlib repo" | less && \
  sudo nvim /etc/pacman.conf

# vulkan-radeon drivers
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

# wine and dine
sudo pacman -S wine-staging
sudo pacman -S --needed --asdeps giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse \
lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite \
lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2

sudo pacman -S steam lutris gamescope gamemode mangohud
paru -S protonup-qt-bin

flatpak install bottles
flatpak install runtime/org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/24.08


# Misc. apps
sudo pacman -S qbittorrent mpv btop yazi fastfetch
paru -S qimgv clipman moc-pulse spotify ani-cli
flatpak install flathub org.gnome.Boxes

#sudo pacman -S 
