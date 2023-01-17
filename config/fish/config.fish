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
