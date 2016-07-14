# GIT
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias schema='git update-index --assume-unchanged db/schema.rb'
alias gemfile='git update-index --assume-unchanged Gemfile.lock'

# Ruby
alias be='bundle exec'

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

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
