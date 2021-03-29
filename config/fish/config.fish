# Remove welcome message
set -g -x fish_greeting ''

# One Dark theme
if status is-interactive
  set -l onedark_options '-b'

  if set -q VIM
    # Using from vim/neovim
    set onedark_options "-256"
  else if string match -iq "eterm*" $TERM
    # Using from emacs
    function fish_title; true; end
    set onedark_options "-256"
  end

  set_onedark $onedark_options
end

# Starship
starship init fish | source

# Autojump
# Python error fix: https://stackoverflow.com/a/61608129
if test -f /home/pierre/.autojump/share/autojump/autojump.fish
  . /home/pierre/.autojump/share/autojump/autojump.fish
end

# MySQL
set -gx SQL_PORT 3306

# Yarn
set -gx PATH $PATH:/usr/bin/yarn

# Java
set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
set -gx PATH $PATH:$JAVA_HOME/bin

# Android studio
set -gx ANDROID_HOME /home/pierre/Workspace/mobile/Android/Sdk

# Helm
set -gx PATH $PATH:/opt/helm
