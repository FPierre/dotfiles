# Install

## Install Alacritty and Fish

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

Log out, then log in again for the changes to take effect

Then install [Fisher](https://github.com/jorgebucaran/fisher):

```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

## Install others packages

GIT:

```sh
sudo add-apt-repository -y ppa:git-core/ppa
```

[Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation):

```sh
curl -fsSL https://starship.rs/install.sh | bash
```

[Brave](https://brave.com/linux/#release-channel-installation):

```sh
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - \
  && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
```

[Chrome](https://www.google.fr/chrome/index.html)

[Insomnia](https://support.insomnia.rest/article/156-installation):

```sh
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
  | sudo tee -a /etc/apt/sources.list.d/insomnia.list
```

[TablePlus](https://tableplus.com/blog/2019/10/tableplus-linux-installation.html):

```sh
wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/21 tableplus main"
```

[PostgreSQL client](https://www.postgresql.org/download/linux/ubuntu/):

```sh
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt '(lsb_release -cs)'-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

And:

```sh
sudo apt update \
  && sudo apt install -y \
  autojump \
  bat \
  brave-browser \
  code \
  exa \
  fonts-firacode \
  git \
  git-flow \
  gnome-tweaks \
  htop \
  insomnia \
  mysql-client \
  postgresql-client-13 \
  powertop \
  preload \
  ripgrep \
  tableplus \
  tlp \
  tlp-rdw \
  vlc
```

- VScode is not installed with Flatpak due to the path mess it introduce
- MySQL server and PostgreSQL via Docker (over `apt`)

[Espanso](https://espanso.org/docs/install/linux) and [Modulo](https://espanso.org/docs/install/linux#installing-modulo):

```sh
wget https://github.com/federico-terzi/espanso/releases/download/v0.7.3/espanso-debian-amd64.deb \
  && sudo apt install ./espanso-debian-amd64.deb \
  && espanso start
```

```sh
sudo wget https://github.com/federico-terzi/modulo/releases/latest/download/modulo-x86_64.AppImage -O $HOME/opt/modulo.AppImage \
  && chmod u+x $HOME/opt/modulo.AppImage \
  && ln -s $HOME/opt/modulo.AppImage /usr/bin/modulo
```

```sh
flatpak install ca.desrt.dconf-editor com.slack.Slack md.obsidian.Obsidian
```

Start TLP:

```sh
sudo tlp start
```

Configure Powertop:

```sh
sudo powertop
```

## Install Node.js environment

[Install fnm](https://github.com/Schniz/fnm#using-a-script-macoslinux), Node.js and Yarn:

```sh
curl -fsSL https://fnm.vercel.app/install | bash \
  && fnm install v16 \
  && npm install -g yarn
```

```sh
# ~/.config/fish/conf.d/fnm.fish

# fnm
set PATH /home/pierre/.fnm $PATH
fnm env --use-on-cd | source
```

```sh
fnm completions --shell fish > ~/.config/fish/completions/fnm.fish
```

Install Yarn global packages:

```sh
yarn global add carotte-cli fast-cli @vue/cli serve
```

### Clone this repository

```sh
git clone git@github.com:FPierre/dotfiles.git ~/.dotfiles \
  && cd ~/.dotfiles
```

### Links to existing configurations

```sh
sudo ln -sfv "$HOME/.dotfiles/config/hosts" /etc/hosts

mkdir ~/.config/alacritty && ln -sfv "$HOME/.dotfiles/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

ln -sfv "$HOME/.dotfiles/config/espanso/default.yml" "$HOME/.config/espanso/default.yml"

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
ln -sfv "$HOME/.dotfiles/config/vscode/snippets/jest-describe.json" "$HOME/.config/Code/User/snippets/jest-describe.json"
```

Install VSCode extensions:

```sh
cat config/vscode/extensions.txt | xargs -n 1 code --install-extension
```

### Get CLI completions

[Source](https://github.com/fish-shell/fish-shell/tree/master/share/completions)

```sh
wget -P ~/.config/fish/completions \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/git.fish \
  https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/completions/kubectl.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/ls.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/helm.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/node.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/npm.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/terraform.fish \
  https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/yarn.fish
```

```sh
wget -O ~/.config/fish/completions/git-flow.fish https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git.fish
```

[For ripgrep](https://github.com/BurntSushi/ripgrep/blob/master/FAQ.md#does-ripgrep-have-support-for-shell-auto-completion)

### Install devOps tools

[Docker](https://docs.docker.com/engine/install/ubuntu) ([with post-installation](https://docs.docker.com/engine/install/linux-postinstall/)):

```sh
sudo apt install -y gnupg lsb-release \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu "(lsb_release -cs)" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```sh
sudo apt update \
  && sudo apt install -y docker-ce docker-ce-cli containerd.io \
  && sudo groupadd docker \
  && sudo usermod -aG docker $USER \
  && newgrp docker
```

A restart is required to make the changes effective

Docker Compose:

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-"(uname -s)"-"(uname -m)"" -o /usr/local/bin/docker-compose \
  && sudo chmod +x /usr/local/bin/docker-compose
```

```sh
docker-compose --version
```

[AWS CLI](https://docs.aws.amazon.com/fr_fr/cli/latest/userguide/install-cliv2-linux.html):

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install
```

```sh
aws --version
```

[Google Cloud CLI](https://cloud.google.com/sdk/docs/install?hl=fr#deb) and Kubectl:

```sh
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && sudo apt update \
  && sudo apt install google-cloud-sdk kubectl
```

[Kubectx and Kubens](https://github.com/ahmetb/kubectx#manual-installation-macos-and-linux):

```sh
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx \
  && sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx \
  && sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens \
  && ln -s /opt/kubectx/completion/kubectx.fish ~/.config/fish/completions/ \
  && ln -s /opt/kubectx/completion/kubens.fish ~/.config/fish/completions/
```

[Helm](https://helm.sh/docs/intro/install/):

```sh
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - \
  && sudo apt-get install apt-transport-https --yes \
  && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list \
  && sudo apt update \
  && sudo apt install helm
```

 [Terraform](https://www.terraform.io/downloads):

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
  && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com "(lsb_release -cs)" main" \
  && sudo apt update && sudo apt install terraform
```

[tfswitch](https://tfswitch.warrensbox.com/Install/#linux):

```sh
wget https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh \
  && chmod 755 install.sh \
  && sudo mkdir /opt/tfswitch \
  && sudo ./install.sh -b /opt/tfswitch
```

* Ansible
* Android Studio (shop flatpak)

### OS configuration

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
```

```sh
gsettings set org.gnome.desktop.calendar show-weekdate true
```

```sh
gsettings set org.gnome.desktop.privacy remember-recent-files false
```

```sh
gsettings set org.gnome.desktop.search-providers disabled ['org.gnome.Contacts.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.seahorse.Application.desktop', 'org.gnome.Terminal.desktop']
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

**Do not forget to add into ~/.ssh/config the private configuration to connect to Cubyn's bastion**

### Use DNS 1.1.1.1

[Installation](https://1.1.1.1/fr/)

### Customize Nautilus sidebar

Comment the locations to hide into:

```sh
nano ~/.config/user-dirs.dirs
```

```sh
echo "enabled=false" > ~/.config/user-dirs.conf
```

### To do

* Install nano syntax highlighting
  * https://www.if-not-true-then-false.com/2009/tuning-nano-text-editor-with-nanorc/
  * https://github.com/scopatz/nanorc
* Completion Docker

## Issues

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

* https://www.dell.com/community/Linux-General/XPS-13-7390-Ubuntu-Screen-flickering/td-p/7430121/page/3
* https://wiki.archlinux.org/title/Dell_XPS_13_(9310)#Random_Hangs_on_i915
* https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/2)-Editing-GRUB
