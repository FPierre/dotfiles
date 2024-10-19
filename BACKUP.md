# Backup

## Backup folders

- `~/.config/`
- `~/.firefoo/saved-queries/`
- `~/.ssh/`
- `~/.tableplus/queries/`
- `~/.tableplus/settings/connections.json`
- `~/Downloads/`
- `~/Pictures/`
- `~/Screenshots/`
- `~/Videos/`
- `~/Workspace/` (without `node_modules/`: https://unix.stackexchange.com/a/345001):

  ```sh
  rsync -rv ~/Workspace /media/pierre/SanDisk\ 256Go/Backup \
    --exclude=node_modules \
    --exclude=env \
    --exclude=.cache \
    --exclude=dist
  ```

## Export installed Fish modules

```sh
fisher ls
```

## Export VSCode unsaved tab

## Export VSCode extensions

```sh
code --list-extensions > ~/.dotfiles/config/vscode/extensions.txt
```

## Export Chrome bookmarks

## Export Brave bookmarks

## Export Browser shortkeys

From extension [shortkeys-custom-keyboard](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck/reviews?hl=en-US&gl=US)

## Export OS shortkey

## Export CGP Cloud config

## Export NPM token

## Export SSH keys

```sh
cp ~/.ssh/* /media/pierre/SanDisk\ 256Go/Backup/ssh
```

## [Export GPG key](https://serverfault.com/a/1040984)

(Copy the passphrase)

```sh
gpg --list-secret-keys
gpg --export --armor "Pierre Flauder" > gpg.pub.asc
gpg --export-secret-keys --armor "Pierre Flauder" > gpg.priv.asc
gpg --export-secret-subkeys --armor "Pierre Flauder" > gpg.sub_priv.asc
gpg --export-ownertrust > ownertrust.txt
```

## Export config Dconf

```sh
dconf dump / > ~/.dotfiles/config/dconf/dconf-settings.ini
```
