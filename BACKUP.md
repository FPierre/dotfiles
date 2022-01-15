# Backup

## TODO

Dconf:

```sh
dconf dump / > ~/.dotfiles/config/dconf/dconf-settings.ini
```

[Copy projects without `node_modules/`](https://unix.stackexchange.com/a/345001):

```sh
sync -rv --exclude=node_modules --exclude=env ~/Workspace /<DESTINATION>
```

Push updates from `~/Documents/Obsidian`

Copy SSH keys:

```sh
cp ~/.ssh/* /media/pierre/SanDisk\ 256Go/Backup/ssh
```

[Copy GPG key](https://serverfault.com/a/1040984):

(Copy the passphrase)

```sh
gpg --list-secret-keys
```

```sh
gpg --export --armor "Pierre Flauder" > gpg.pub.asc
gpg --export-secret-keys --armor "Pierre Flauder" > gpg.priv.asc
gpg --export-secret-subkeys --armor "Pierre Flauder" > gpg.sub_priv.asc
gpg --export-ownertrust > ownertrust.txt
```

- Config TablePlus
- Config MySQL Workbench
- VSCode unsaved tab
- Fish `fisher ls`
- OS shortkey
- Insomnia
- Kubectl
- Yarn `yarn global list`
- [Brave](https://support.brave.com/hc/en-us/articles/360019782291-How-do-I-import-or-export-browsing-data-)
- NPM token
- Config GCloud
- Config AWS

Backup VSCode extensions:

```sh
code --list-extensions >> config/vscode/extensions.txt
```
