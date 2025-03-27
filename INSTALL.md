# Install

> Needed: Yubikey, phone with 2FA, Bitwarden master password, ssh from backup

## Install Alacritty, Fish and Starship

```sh
sudo add-apt-repository ppa:aslatter/ppa \
  && sudo add-apt-repository ppa:fish-shell/release-4 \
  && sudo apt update \
  && sudo apt install alacritty=0.15.1+1-20250317T050111~jammy-5a68e98d fish \
  && mkdir -p ~/.config/alacritty \
  && curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml \
  && curl -sS https://starship.rs/install.sh | sh
```

Set Fish as the [default shell](https://fishshell.com/docs/current/tutorial.html#switching-to-fish):

```sh
chsh -s /usr/bin/fish
```

## Install GIT and restore SSH and GPG

```sh
sudo add-apt-repository -y ppa:git-core/ppa \
  && sudo apt update \
  && sudo apt install -y git
```

```sh
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
  && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
```

```sh
mkdir -p ~/.ssh \
  && cp /media/pierre/SanDisk\ 256Go/Backup/.ssh/* ~/.ssh/ \
  && sudo chmod 600 ~/.ssh/id_ed25519 ~/.ssh/known_hosts \
  && sudo chmod 644 ~/.ssh/id_ed25519.pub \
  && ssh-add ~/.ssh/id_ed25519
```

(Copy the passphrase)

```sh
gpg --import /media/pierre/SanDisk\ 256Go/Backup/gpg/gpg.pub.asc
gpg --import /media/pierre/SanDisk\ 256Go/Backup/gpg/gpg.priv.asc
gpg --import /media/pierre/SanDisk\ 256Go/Backup/gpg/gpg.sub_priv.asc
gpg --import-ownertrust /media/pierre/SanDisk\ 256Go/Backup/gpg/ownertrust.txt
```

```sh
git clone git@github.com:FPierre/dotfiles.git ~/.dotfiles \
  && cd ~/.dotfiles
```

## Install softwares

[Brave](https://brave.com/linux/#release-channel-installation)

[Chrome](https://www.google.fr/chrome/index.html)

[Espanso](https://espanso.org/docs/install/linux)

```sh
espanso install actually-all-emojis
```

[eza](https://github.com/eza-community/eza/blob/main/INSTALL.md)

[btm](https://github.com/ClementTsang/bottom?tab=readme-ov-file#debian--ubuntu)

[TablePlus](https://tableplus.com/blog/2019/10/tableplus-linux-installation.html)

And:

```sh
sudo apt update \
  && sudo apt install -y \
  autojump \
  bat \
  brave-browser \
  code \
  fonts-firacode \
  gh \
  gnome-tweaks \
  powertop \
  preload \
  ripgrep \
  tableplus\
  vlc
```

If some sources warn like:

```
Skipping acquire of configured file 'main/binary-i386/Packages' as repository 'https://brave-browser-apt-release.s3.brave.com stable InRelease' doesn't support architecture 'i386'
```

[Fix](https://askubuntu.com/a/741411) by adding `arch=amd64`:

```sh
sudo nano /etc/apt/sources.list.d/brave-browser-release.list
```

```
# before
deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main

# after
deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main
```

```sh
flatpak install \
  ca.desrt.dconf-editor \
  com.belmoussaoui.Obfuscate \
  com.github.joseexposito.touche \
  com.slack.Slack \
  com.spotify.Client \
  com.usebruno.Bruno \
  com.boxy_svg.BoxySVG
```

Configure Powertop:

```sh
sudo powertop
```

### Setup Bitwarden extension on Chrome

- Install the extension
- Connect to Bitwarden

### Links to existing configurations

```sh
sudo ln -sfv "$HOME/.dotfiles/config/hosts" /etc/hosts

mkdir -p "$HOME/.config/alacritty" && ln -sfv "$HOME/.dotfiles/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

ln -sfv "$HOME/.dotfiles/config/espanso/match/base.yml" "$HOME/.config/espanso/match/base.yml"

mkdir -p "$HOME/.config/fish" && mkdir -p "$HOME/.config/fish/functions"
ln -sfv "$HOME/.dotfiles/config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sfv "$HOME/.dotfiles/config/fish/functions/c.fish" "$HOME/.config/fish/functions/c.fish"
ln -sfv "$HOME/.dotfiles/config/fish/functions/ls.fish" "$HOME/.config/fish/functions/ls.fish"
ln -sfv "$HOME/.dotfiles/config/fish/functions/bat.fish" "$HOME/.config/fish/functions/bat.fish"

ln -sfv "$HOME/.dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"

ln -sfv "$HOME/.dotfiles/config/bottom/bottom.toml" "$HOME/.config/bottom/bottom.toml"

ln -sfv "$HOME/.dotfiles/config/git/.gitconfig" "$HOME/.gitconfig"

ln -sfv "$HOME/.dotfiles/config/code/settings.json" "$HOME/.config/Code/User/settings.json"
ln -sfv "$HOME/.dotfiles/config/code/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

ln -sfv "$HOME/.dotfiles/config/touchegg/touchegg.conf" "$HOME/.config/touchegg/touchegg.conf"

cp "$HOME/.dotfiles/config/autostart/io.elementary.appcenter-daemon.desktop" "$HOME/.config/autostart"
```

Install Code extensions:

```sh
cat config/code/extensions.txt | xargs -n 1 code --install-extension
```

### Get CLI completions

[Source](https://github.com/fish-shell/fish-shell/tree/master/share/completions)

```sh
wget -P ~/.config/fish/completions \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/apt-get.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/apt.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/bun.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/fisher.fish \
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
curl -sL https://git.io/fisher | source \
  && fisher install jorgebucaran/fisher \
  && fisher install lgathy/google-cloud-sdk-fish-completion
```

## Install Node.js environment

Install [fnm](https://github.com/Schniz/fnm#using-a-script-macoslinux), Node.js and Yarn:

```sh
curl -fsSL https://fnm.vercel.app/install | bash \
  && fnm install v22 \
  && npm install -g yarn pnpm \
  && fnm completions --shell fish > ~/.config/fish/completions/fnm.fish \
  && pnpm completion fish > ~/.config/fish/completions/pnpm.fish \
  && yarn global add netlify-cli http-server grunt-cli firebase-tools fireway drizzle-kit create-vite @nestjs/cli
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
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Code'
```

```sh
gsettings set org.gnome.mutter attach-modal-dialogs false
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter dynamic-workspaces false
```

Their is a conflict with shortkey to "move window to another workspace" with "Window > View split on left/right". Remove shortkey `ctrl+super+left` and `ctrl+super+right` on them:

```sh
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left @as\ \[\]
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right @as\ \[\]
```

## Touchpad configuration

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

Sync configuration:

|   Local   |   Mega    |
| :-------: | :-------: |
| Documents | Documents |

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

## Install others tools

### [Google Cloud CLI](https://cloud.google.com/sdk/docs/install#deb)

### [Cloud SQL Proxy](https://github.com/GoogleCloudPlatform/cloud-sql-proxy#installation)

### [Firefoo](https://github.com/mltek/firefoo-releases/releases)

### PostgreSQL server: via Docker (over `apt`)

### [PostgreSQL client](https://www.postgresql.org/download/linux/ubuntu/)

```sh
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt '(lsb_release -cs)'-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

## Touchpad behaviors

The touchpad should:

- Go back: 3 fingers swipe on left
- Go next: 3 fingers swipe on right

### Keyboard behaviors

The keyboard should:

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

### Code

- Move a line: `alt` + `key up|down`
- Duplicate a line: `ctrl` + `shift` + `alt` + `key up|down`

## Possibles issues

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
