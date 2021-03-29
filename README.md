# Dotfiles

## New installation

### Setup

Install Alacritty, Fish and GIT:

```sh
sudo add-apt-repository ppa:aslatter/ppa \
  && add-apt-repository ppa:fish-shell/release-3 \
  && add-apt-repository -y ppa:git-core/ppa \
  && sudo apt update \
  && sudo apt install alacritty fish git
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

### Install others packages

[Brave](https://brave.com/linux/#release-channel-installation):

```sh
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - \
  && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
```

[Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation):

```sh
curl -fsSL https://starship.rs/install.sh | bash
```

[Chrome](https://www.google.fr/chrome/?brand=FKPE&gclsrc=ds&gclsrc=ds)

And:

```sh
sudo apt update \
  && sudo apt install \
  brave-browser \
  autojump \
  fonts-firacode \
  htop \
  gnome-tweaks \
  powertop \
  preload \
  tlp \
  tlp-rdw \
  vlc
```

```sh
flatpak install com.visualstudio.code ca.desrt.dconf-editor
```

[Install fnm](https://github.com/Schniz/fnm#using-a-script-macoslinux):

```sh
curl -fsSL https://fnm.vercel.app/install | bash
```

Then install Node.js v14 and Yarn:

```sh
fnm install v14 \
  && npm install -g yarn
```

### Clone the repository

```sh
git clone https://github.com/FPierre/dotfiles.git ~/.dotfiles \
 && cd ~/.dotfiles
```

### Links to existing configurations

```sh
sudo ln -sfv config/hosts /etc/hosts

mkdir ~/.config/alacritty && ln -sfv "$HOME/.dotfiles/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

ln -sfv "$HOME/.dotfiles/config/starship/starship.toml" "$HOME/.config/starship.toml"

ln -sfv "$HOME/.dotfiles/config/git/.gitconfig" "$HOME/.gitconfig"

ln -sfv "$HOME/.dotfiles/config/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -sfv "$HOME/.dotfiles/config/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
ln -sfv "$HOME/.dotfiles/config/vscode/snippets/jest-describe.json" "$HOME/.config/Code/User//snippets/jest-describe.json"
```

* [Insomnia](https://support.insomnia.rest/article/23-installation#linux)
* Slack (shop flatpak)
* [Texpander](https://github.com/leehblue/texpander)
* [GIT Flow completion](https://github.com/bobthecow/git-flow-completion)

* AWS
* Ansible
* Kubectl
* MySQL Workbench

[Robot 3T](https://gist.github.com/abdallahokasha/37911a64ad289487387e2d1a144604ae):

```sh
sudo rm -Rf /opt/robo3t/ && mkdir /opt/robo3t/
sudo mv robo3t-1.4.3-linux-x86_64-122dbd9/* /opt/robo3t/
sudo chmod +x /opt/robo3t/bin/robo3t
```

* Terraform
* Vue CLI
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* Android Studio (shop flatpak)


### Restore Dconf Editor configuration

[Load the configuration](https://askubuntu.com/a/1069446):

```sh
dconf load / < config/dconf/dconf-settings.ini
```

### To do

* Install nano syntax highlighting
  * https://www.if-not-true-then-false.com/2009/tuning-nano-text-editor-with-nanorc/
  * https://github.com/scopatz/nanorc
* Start TLP: `sudo tlp start`
* Install Yarn global packages: `yarn global add carotte-cli fast-cli @vue/cli serve`

## Backup an installation

Dconf:

```sh
dconf dump / > ~/.dotfiles/config/dconf/dconf-settings.ini
```

[Copy projects without `node_modules/`](https://unix.stackexchange.com/a/345001):

```sh
sync -rv --exclude=node_modules --exclude=env ~/Workspace /<DESTINATION>
```

Copy Zettler:

Copy SSH keys:

Copy GPG key:

* VSCode unsaved tab
* Fish `fisher ls`
* OS shortkey
* Insomnia
* Kubectl
* Yarn `yarn global list`

* [Brave](https://support.brave.com/hc/en-us/articles/360019782291-How-do-I-import-or-export-browsing-data-)
* MySQL Workbench connections
* NPM token
* Starship
