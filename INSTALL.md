# Install

## Install Alacritty, Fish and Fisher

```sh
sudo add-apt-repository ppa:aslatter/ppa \
  && sudo add-apt-repository ppa:fish-shell/release-3 \
  && sudo apt update \
  && sudo apt install alacritty fish
```

Set Fish as the [default shell](https://fishshell.com/docs/current/tutorial.html#switching-to-fish):

```sh
echo /usr/bin/fish | sudo tee -a /etc/shells \
  && chsh -s /usr/bin/fish
```

```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

## Install main packages

GIT:

```sh
sudo add-apt-repository -y ppa:git-core/ppa
```

[Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation):

[Brave](https://brave.com/linux/#release-channel-installation):

[Chrome](https://www.google.fr/chrome/index.html)

[Espanso](https://espanso.org/docs/install/linux)

[Bruno](https://www.usebruno.com/downloads)

And:

```sh
sudo apt update \
  && sudo apt install -y \
  autojump \
  bat \
  brave-browser \
  btm \
  code \
  eza \
  fonts-firacode \
  git \
  gnome-tweaks \
  powertop \
  preload \
  ripgrep \
  vlc
```

(VScode is not installed with Flatpak due to the path mess it introduce)

```sh
flatpak install \
  ca.desrt.dconf-editor \
  com.belmoussaoui.Obfuscate \
  com.github.joseexposito.touche \
  com.slack.Slack \
  com.spotify.Client \
  com.boxy_svg.BoxySVG
```

Configure Powertop:

```sh
sudo powertop
```

### Clone this repository

```sh
git clone git@github.com:FPierre/dotfiles.git ~/.dotfiles \
  && cd ~/.dotfiles
```

### Restore SSH and GPG

```sh
mkdir ~/.ssh \
  && cp /media/pierre/SanDisk\ 256Go/Backup/ssh/* ~/.ssh/ \
  && sudo chmod 600 ~/.ssh/id_rsa ~/.ssh/config ~/.ssh/known_hosts \
  && sudo chmod 644 ~/.ssh/id_rsa.pub
```

(Copy the passphrase)

```sh
gpg --import /media/pierre/SanDisk\ 256Go/Backup/gpg/gpg.pub.asc
gpg --import /media/pierre/SanDisk\ 256Go/Backup/gpg/gpg.priv.asc
gpg --import /media/pierre/SanDisk\ 256Go/Backup/gpg/gpg.sub_priv.asc
gpg --import-ownertrust /media/pierre/SanDisk\ 256Go/Backup/gpg/ownertrust.txt
```

### Links to existing configurations

```sh
sudo ln -sfv "$HOME/.dotfiles/config/hosts" /etc/hosts

mkdir ~/.config/alacritty && ln -sfv "$HOME/.dotfiles/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

ln -sfv "$HOME/.dotfiles/config/espanso/match/base.yml" "$HOME/.config/espanso/match/base.yml"

ln -sfv "$HOME/.dotfiles/config/fish/abbreviations.fish" "$HOME/.config/fish/abbreviations.fish"
source ~/.config/fish/abbreviations.fish
ln -sfv "$HOME/.dotfiles/config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sfv "$HOME/.dotfiles/config/fish/functions/c.fish" "$HOME/.config/fish/functions/c.fish"
ln -sfv "$HOME/.dotfiles/config/fish/functions/ls.fish" "$HOME/.config/fish/functions/ls.fish"
ln -sfv "$HOME/.dotfiles/config/fish/functions/bat.fish" "$HOME/.config/fish/functions/bat.fish"

ln -sfv "$HOME/.dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"

ln -sfv "$HOME/.dotfiles/config/git/.gitconfig" "$HOME/.gitconfig"

ln -sfv "$HOME/.dotfiles/config/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -sfv "$HOME/.dotfiles/config/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
```

Install VSCode extensions:

```sh
cat config/vscode/extensions.txt | xargs -n 1 code --install-extension
```

### Get CLI completions

[Source](https://github.com/fish-shell/fish-shell/tree/master/share/completions)

```sh
wget -P ~/.config/fish/completions \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/apt.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/flatpak.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/git.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/kill.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/killall.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/ls.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/ngrok.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/node.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/npm.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/pg_dump.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/pkill.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/ssh.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/starship.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/yarn.fish
```

[gcloud completion](https://github.com/lgathy/google-cloud-sdk-fish-completion):

```sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

```sh
fisher install lgathy/google-cloud-sdk-fish-completion
```

## Install Node.js environment

[Install fnm](https://github.com/Schniz/fnm#using-a-script-macoslinux), Node.js and Yarn:

```sh
curl -fsSL https://fnm.vercel.app/install | bash \
  && fnm install v20 \
  && npm install -g yarn \
  && fnm completions --shell fish > ~/.config/fish/completions/fnm.fish
```

```sh
cat << EOF > ~/.config/fish/conf.d/fnm.fish
set PATH /home/pierre/.fnm $PATH
fnm env --use-on-cd | source
EOF
```

## OS configuration

Connect to [Gnome Shell extensions](https://extensions.gnome.org/) and download extensions

[Make Alt+tab only switch in the current workspace](https://coderwall.com/p/m5mhoq/gnome-3-how-to-alt-tab-windows-on-current-workspace-only) and [ungroup](https://superuser.com/questions/394376/how-to-prevent-gnome-shells-alttab-from-grouping-windows-from-similar-apps/860001#860001):

```sh
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
```

```sh
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab 13'
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.interface font-name 'DejaVu Sans 12'
gsettings set org.gnome.desktop.interface gtk-theme 'Pop-dark'
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 13'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.search-providers disabled \[\'org.gnome.Contacts.desktop\',\ \'org.gnome.Calculator.desktop\',\ \'org.gnome.Calendar.desktop\',\ \'org.gnome.seahorse.Application.desktop\',\ \'org.gnome.Terminal.desktop\'\]
```

```sh
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Primary><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Primary><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Primary><Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Primary><Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Primary><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>apostrophe']"
```

```sh
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Primary><Alt>z']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Primary><Alt>t']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Primary><Alt>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>r'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'VSCode'
```

```sh
gsettings set org.gnome.mutter attach-modal-dialogs false
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter dynamic-workspaces false
```

To move window to another workspace, it is possible their is a conflict with "Window > View split on left/right". Remove shortkey ctrl+command+left/right on them

## Touchpad configuration

- Install [Touché](https://flathub.org/apps/details/com.github.joseexposito.touche)

![Screenshot from 2023-01-27 08-17-10](https://user-images.githubusercontent.com/3307327/215030385-267e9a6d-6391-4bba-bb9c-180754bece9e.png)

## Browser configuration

- Install [Shortkeys](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck/reviews?hl=en-US&gl=US) extension with the following configuration:

```json
[
  {
    "key": "ctrl+up",
    "label": "Tab left",
    "action": "prevtab",
    "sites": "",
    "sitesArray": [""],
    "activeInInputs": true,
    "blacklist": false
  },
  {
    "key": "ctrl+down",
    "label": "Tab right",
    "action": "nexttab",
    "sites": "",
    "sitesArray": [""],
    "activeInInputs": true,
    "blacklist": false
  },
  {
    "key": "ctrl+shift+up",
    "label": "Move tab to left",
    "action": "movetableft",
    "sites": "",
    "sitesArray": [""],
    "activeInInputs": true,
    "blacklist": false
  },
  {
    "key": "ctrl+shift+down",
    "label": "Move tab to right",
    "action": "movetabright",
    "sites": "",
    "sitesArray": [""],
    "activeInInputs": true,
    "blacklist": false
  }
]
```

## Install Mega.nz

[App](https://mega.io/desktop)

Configuration:

|   Local   |   Mega    |
| :-------: | :-------: |
| .dotfiles | .dotfiles |
|   .ssh    |   .ssh    |
|  Desktop  |  Desktop  |
| Documents | Documents |
| Downloads | Downloads |
| Pictures  | Pictures  |
| Workspace | Workspace |

```
*.crdownload
*.lock
*.log
*.sb-????????-??????
*.tmp
*~.*
.
..
.git
Thumbs.db
desktop.ini
dist
node_modules
~*
```

## Link to NextDNS

[NextDNS](https://nextdns.io/)

## Customize Nautilus sidebar

Comment the locations to hide into:

```sh
nano ~/.config/user-dirs.dirs
```

```sh
echo "enabled=false" > ~/.config/user-dirs.conf
```

## Touchpad behaviors

At the end, the touchpad should behave like:

- Go back: 3 fingers swipe on left
- Go next: 3 fingers swipe on right

## Keyboard behaviors

At the end, the keyboard should behave like:

### OS

- Navigate through workspaces: `ctrl` + `alt` + `key up|right|down|left`
- Move window through workspaces: `ctrl` + `super` + `key up|right|down|left`
- Open universal search: `super`
- Open file browser: `ctrl` + `alt` + `z`
- Open browser: `ctrl` + `alt` + `e`
- Open IDE: `ctrl` + `alt` + `r`
- Open terminal: `ctrl` + `alt` + `t`
- Navigate on open windows on the same workspace: `alt` + `tab`

### Browser

- Open a new tab: `ctrl` + `t`
- Close a tab: `ctrl` + `w`
- Reload a tab: `ctrl` + `r`
- Move a tab: `ctrl` + `shift` + `key up|down`
- Navigate on tabs: `ctrl` + `key up|down`

### IDE

- Move a line: `alt` + `key up|down`
- Duplicate a line: `ctrl` + `shift` + `alt` + `key up|down`

## Install others tools

### [Google Cloud CLI](https://cloud.google.com/sdk/docs/install#deb)

### Firebase CLI

```sh
yarn global add firebase-tools
```

### [TablePlus](https://tableplus.com/blog/2019/10/tableplus-linux-installation.html)

```sh
wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/22 tableplus main"
```

### PostgreSQL server: via Docker (over `apt`)

### [PostgreSQL client](https://www.postgresql.org/download/linux/ubuntu/)

```sh
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt '(lsb_release -cs)'-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

## Fix issues

### Screen flicker on battery

```sh
sudo nano /boot/efi/loader/entries/Pop_OS-current.conf
```

Append `i915.enable_psr=0` to the `options root=UUID...` line. It should looks like:

```sh
options root=UUID=2c315166-0d44-429d-ae29-d04b845dd9ad ro quiet loglevel=0 systemd.show_status=false splash i915.enable_psr=0
```

```sh
sudo bootctl update
```

Then reboot

Sources:

- https://www.dell.com/community/Linux-General/XPS-13-7390-Ubuntu-Screen-flickering/td-p/7430121/page/3
- https://wiki.archlinux.org/title/Dell_XPS_13_(9310)#Random_Hangs_on_i915
- https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/2)-Editing-GRUB
