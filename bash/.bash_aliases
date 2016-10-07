# SSH
alias nice='ssh seniormedia@nice.seniormedia.fr'
alias richmond='ssh seniormedia@richmond.seniormedia.fr'
alias chicago='ssh seniormedia@chicago.seniormedia.fr'
alias msi='ssh pierre@88.190.46.158'

# GIT
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gm='git merge'
alias schema='git update-index --assume-unchanged db/schema.rb'
alias gemfile='git update-index --assume-unchanged Gemfile.lock'

# Ruby on Rails
alias bi='bundle install'
alias be='bundle exec'
alias rs="rails s"
alias rc="rails c"
alias rt="rails t"
alias cop="rubocop"

# Typo
alias exti='exit'
alias eixt='exit'
alias exut='exit'

# Launcher
alias em='emacs -nw'
alias server='python -m SimpleHTTPServer'

# Make sure aliases can be sudo'ed
alias sudo="sudo "

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show active network listeners
alias netlisteners='lsof -i -P | grep LISTEN'
