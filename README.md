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

### Install packages

* OK [Chrome](https://www.google.fr/chrome/?brand=FKPE&gclsrc=ds&gclsrc=ds)
* OK Brave
* OK Starship
* OK fonts-firacode
* OK GIT Flow
* OK VLC
* OK Gnome tweaks
* Insomnia
* OK htop
* OK powertop
* OK preload
* OK tlp
* OK tlp-rdw

### Get dotfiles and run installation

```sh
git clone https://github.com/FPierre/dotfiles ~/.dotfiles
cd ~/.dotfiles
chmod +x install
./install
```
