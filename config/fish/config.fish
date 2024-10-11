# Remove welcome message
set -g -x fish_greeting ''

# Unbind CTRL+D that exit the terminal
# https://github.com/fish-shell/fish-shell/issues/5593
bind \cd true

# Starship
starship init fish | source

# Autojump
# Python error fix: https://stackoverflow.com/a/61608129
# if test -f /home/pierre/.autojump/share/autojump/autojump.fish
#   . /home/pierre/.autojump/share/autojump/autojump.fish
# end
. /usr/share/autojump/autojump.fish

# Yarn
# Declare global bin path
# Found with: yarn global bin
set -gx PATH $PATH:/home/pierre/.yarn/bin

# Zed

abbr -a exti exit
abbr -a gti git

abbr -a bat batcat

abbr -a npm-pre-publish "npm pack && tar -xvzf *.tgz"

abbr -a docker-backend-up docker

# Bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Google SQL Cloud Proxy
# abbr -a proxy-dev /opt/cloud-sql-proxy/cloud-sql-proxy arsen-platform-dev:europe-west3:arsen-backend-dev
abbr -a proxy-dev /opt/cloud-sql-proxy/cloud-sql-proxy arsen-platform-dev:europe-west3:arsen-postgresql-dev
abbr -a proxy-prod /opt/cloud-sql-proxy/cloud-sql-proxy arsen-platform-prod:europe-west3:arsen-postgresql-prod

abbr -a p pnpm

# pnpm
set -gx PNPM_HOME "/home/pierre/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
