# GIT
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias schema='git update-index --assume-unchanged db/schema.rb'
alias gemfile='git update-index --assume-unchanged Gemfile.lock'

# Ruby on Rails
alias bi='bundle install'
alias be='bundle exec'
alias rs="rails s"
alias rc="rails c"
alias logreq='tail -f log/development.log -n 10000 | grep --line-buffered Started'

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
# sniff GET and POST traffic over http
alias sniff="sudo ngrep -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
