sudo pacman -Rns brave-browser --noconfirm

pkill brave
rm -rf ~/.config/BraveSoftware
rm -rf ~/.cache/BraveSoftware
rm -rf ~/.local/share/BraveSoftware

sudo pacman -S brave-browser --noconfirm