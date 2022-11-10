# Backup

- Push dotfiles to GitHub (also exists in Mega.nz)
- Push Obsidian folder to GitHub (also exists in Mega.nz)
- Push Workspace folder to GitHub (also exists in Mega.nz)
- Export all configurations from Insomnia
- Export Fisher:

```sh
fisher ls
```

- Export VSCode unsaved tab
- Export VSCode extensions:

```sh
code --list-extensions >> ~/.dotfiles/config/vscode/extensions.txt
```

- Forward critical emails to personal inbox
- Export Browser [Shortkeys](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck/reviews?hl=en-US&gl=US) extension
- Export OS shortkey

## Private

- [Export config Brave](https://support.brave.com/hc/en-us/articles/360019782291-How-do-I-import-or-export-browsing-data-)
- Export config cloud (if exists)
- Export NPM token
- Export SSH keys:

```sh
cp ~/.ssh/* /media/pierre/SanDisk\ 256Go/Backup/ssh
```

- [Export GPG key](https://serverfault.com/a/1040984):

(Copy the passphrase)

```sh
gpg --list-secret-keys
gpg --export --armor "Pierre Flauder" > gpg.pub.asc
gpg --export-secret-keys --armor "Pierre Flauder" > gpg.priv.asc
gpg --export-secret-subkeys --armor "Pierre Flauder" > gpg.sub_priv.asc
gpg --export-ownertrust > ownertrust.txt
```

- Export config TablePlus (`~/.tableplus/settings/connections.json`, `~/.tableplus/queries/`)
- Export config Dconf:

```sh
dconf dump / > ~/.dotfiles/config/dconf/dconf-settings.ini
```

## Help

- [Copy projects without `node_modules/`](https://unix.stackexchange.com/a/345001):

```sh
rsync -rv --exclude=node_modules --exclude=env ~/Workspace /<DESTINATION>
```
