# Backup

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
* Config GCloud
* Config AWS

Backup VSCode extensions:

```sh
code --list-extensions >> config/vscode/extensions.txt
```
