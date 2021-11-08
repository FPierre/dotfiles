# Remove welcome message
set -g -x fish_greeting ''

# Unbind CTRL+D that exit the terminal
# https://github.com/fish-shell/fish-shell/issues/5593
bind \cd true

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
# if test -f /home/pierre/.autojump/share/autojump/autojump.fish
#   . /home/pierre/.autojump/share/autojump/autojump.fish
# end
. /usr/share/autojump/autojump.fish

# MySQL Docker (through Docker compose config)
set -gx SQL_PORT 3306

# Yarn
# Declare global bin path
# Found with: yarn global bin
set -gx PATH $PATH:/home/pierre/.yarn/bin

# Terraform
set -gx PATH $PATH:/opt/terraform

# tfswitch
set -gx PATH $PATH:/opt/tfswitch

# Java
# set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
# set -gx PATH $PATH:$JAVA_HOME/bin

# Android studio
# set -gx ANDROID_HOME /home/pierre/Workspace/mobile/Android/Sdk

# Helm
# set -gx PATH $PATH:/opt/helm

# Camunda Modeler
set -gx PATH $PATH:/opt/camunda

# Cloud SQL proxy
set -gx PATH $PATH:/usr/lib/google-cloud-sdk/bin

# Fly.io
set -gx FLYCTL_INSTALL /home/pierre/.fly
set -gx PATH $PATH:$FLYCTL_INSTALL/bin
