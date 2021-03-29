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

[Insomnia](https://support.insomnia.rest/article/156-installation):

```sh
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list \
  && wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -
```

[Chrome](https://www.google.fr/chrome/?brand=FKPE&gclsrc=ds&gclsrc=ds)

And:

```sh
sudo apt update \
  && sudo apt install -y \
  autojump \
  brave-browser \
  code \
  fonts-firacode \
  gnome-tweaks \
  htop \
  insomnia \
  powertop \
  preload \
  tlp \
  tlp-rdw \
  vlc
```

```sh
flatpak install ca.desrt.dconf-editor com.slack.Slack
```

[Install fnm](https://github.com/Schniz/fnm#using-a-script-macoslinux), Node.js and Yarn:

```sh
curl -fsSL https://fnm.vercel.app/install | bash \
  && fnm install v14 \
  && npm install -g yarn
```

Install Yarn global packages:

```sh
yarn global add carotte-cli fast-cli @vue/cli serve
```

[Robo 3T](https://gist.github.com/abdallahokasha/37911a64ad289487387e2d1a144604ae):

Download from the [website](https://robomongo.org/download)

```sh
sudo mkdir /opt/robo3t/ \
  && tar -xvzf ~/Download/robo3t-1.4.3-linux-x86_64-48f7dfd.tar.gz \
  && sudo mv robo3t-1.4.3-linux-x86_64-48f7dfd/* /opt/robo3t/ \
  && sudo chmod +x /opt/robo3t/bin/robo3t
```

[Zettlr](https://www.zettlr.com/download/deb)

### Clone this repository

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
ln -sfv "$HOME/.dotfiles/config/vscode/snippets/jest-describe.json" "$HOME/.config/Code/User/snippets/jest-describe.json"
```

### Install devOps tools

[Docker](https://docs.docker.com/engine/install/ubuntu) ([with post-installation](https://docs.docker.com/engine/install/linux-postinstall/)):

```sh
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```sh
sudo apt update \
  && sudo apt install -y docker-ce docker-ce-cli containerd.io \
  && sudo groupadd docker \
  && sudo usermod -aG docker $USER \
  && newgrp docker
```

```sh
docker run hello-world
```

Docker Compose:

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
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

[Kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl):

```sh
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
  && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  && sudo apt update \
  && sudo apt install -y kubectl
```

[Helm](https://helm.sh/docs/intro/install/):

```sh
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - \
  && sudo apt-get install apt-transport-https --yes \
  && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list \
  && sudo apt update \
  && sudo apt install helm
```

* [Texpander](https://github.com/leehblue/texpander)
* [GIT Flow completion](https://github.com/bobthecow/git-flow-completion)
* Ansible
* MySQL Workbench
* Terraform
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
* Config GCloud
* Config AWS
