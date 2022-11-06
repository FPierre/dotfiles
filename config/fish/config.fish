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

# tfswitch
set -gx PATH $PATH:/opt/tfswitch

# Java
# set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
# set -gx PATH $PATH:$JAVA_HOME/bin

# Android studio
# set -gx ANDROID_HOME /home/pierre/Workspace/mobile/Android/Sdk

# Camunda Modeler
set -gx PATH $PATH:/opt/camunda-modeler

# Cloud SQL proxy
#set -gx PATH $PATH:/usr/lib/google-cloud-sdk/bin

# Fly.io
#set -gx FLYCTL_INSTALL /home/pierre/.fly
#set -gx PATH $PATH:$FLYCTL_INSTALL/bin

# Modulo
set -gx PATH $PATH:/opt/modulo/modulo.AppImage

# kubectx
set -gx PATH $PATH:/opt/kubectx

# kubens
set -gx PATH $PATH:/opt/kubens

# Encore
set ENCORE_INSTALL /home/pierre/.encore
set -gx PATH $ENCORE_INSTALL/bin:$PATH

# Python 2.7
set -gx PYTHON /usr/bin/python2.7
