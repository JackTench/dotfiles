# Jack Tench 2024

# Install paru.
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..

# Install packages.
sudo pacman -S --noconfirm fish qtile picom nitrogen alacritty rofi thunar thunar-archive-plugin xarchiver neovim pavucontrol dunst ranger lazygit flameshot lxappearance zathura
paru -S --noconfirm bibata-cursor-theme-bin nordic-theme nordzy-icon-theme papirus-nord
