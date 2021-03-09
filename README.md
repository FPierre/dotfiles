# Dotfiles

## Usage

### Install GIT and Fish

```sh
sudo add-apt-repository -y ppa:git-core/ppa \
  && apt-add-repository ppa:fish-shell/release-3 \
  && apt update \
  && apt install git fish
```

Set Fish as the [default shell](https://fishshell.com/docs/current/tutorial.html#switching-to-fish):

```sh
echo /usr/bin/fish | sudo tee -a /etc/shells
```

```sh
chsh -s /usr/bin/fish
```

Log out, then log in again for the changes to take effect

Then install [Fisher](https://github.com/jorgebucaran/fisher):

```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

### Packages to install
  
* Dconf Editor (shop flatpak)
* NPM
* Yarn
* [Brave](https://brave.com/linux/#release-channel-installation)
* [Chrome](https://www.google.fr/chrome/?brand=FKPE&gclsrc=ds&gclsrc=ds)
* [Fisher](https://github.com/jorgebucaran/fisher#installation)
* [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
* [fnm](https://github.com/Schniz/fnm#using-a-script-macoslinux)

```bash
sudo apt install alacritty autojump fonts-firacode htop gnome-tweaks powertop preload tlp tlp-rdw
```

* [Insomnia](https://support.insomnia.rest/article/23-installation#linux)
* Slack (shop flatpak)
* [Texpander](https://github.com/leehblue/texpander)
* VSCode (shop .deb)
* [GIT Flow completion](https://github.com/bobthecow/git-flow-completion)

```bash
apt install vlc
```

* AWS
* Ansible
* Kubectl
* MySQL Workbench
* Robot 3T
* Terraform
* Vue CLI
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)

* Android Studio (shop flatpak)

## To backup

* Zettler
* GPG key
* SSH keys
* Brave
* VSCode unsaved tab
* MySQL Workbench connections
* Fish
* OS shortkey
* Insomnia
* Kubectl
* NPM
* Starship
* Yarn
