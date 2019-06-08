# note

```
# fcitx setting
sudo apt install -y fcitx-mozc
im-config -n fcitx

# ALT L:EN, R:JP
sed -i "s/^.*ActivateKey=.*/ActivateKey=ALT_RALT/" .config/fcitx/config
sed -i "s/^.*InactivateKey=.*/InactivateKey=ALT_LALT/" .config/fcitx/config
# remove Ctrl+Space
sed -i "s/^.*TriggerKey=.*/TriggerKey=ZENKAKUHANKAKU/" .config/fcitx/config

# change system file name to english
LANG=C xdg-user-dirs-gtk-update

# keyboard & mouse
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"
gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# shell
sudo apt install -y zsh
chsh -s /usr/bin/zsh

# terminal color

cat << EOF | dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/
[/]
bold-is-bright=false
foreground-color='rgb(131,148,150)'
use-transparent-background=true
palette=['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']
bold-color-same-as-fg=true
cursor-colors-set=false
background-transparency-percent=10
background-color='rgb(0,43,54)'
highlight-colors-set=false
use-theme-colors=false
visible-name='Solarized'
use-theme-transparency=false
EOF
gsettings set org.gnome.Terminal.ProfilesList default b1dcc9dd-5262-4d8d-a863-c897e6d979b9



sudo apt install -y chrome-gnome-shell
# install User Themes https://extensions.gnome.org/extension/19/user-themes/
snap install communitheme

apt install borgbackup
# in some directory
borg init -e none home
# copy script from https://borgbackup.readthedocs.io/en/stable/quickstart.html#automating-backups
# run it once

# set cron like
0 1 * * * /mnt/data/Backup/backup-home.sh > /mnt/data/Backup/backup-home.1.log
0 13 * * * /mnt/data/Backup/backup-home.sh > /mnt/data/Backup/backup-home.13.log
```
