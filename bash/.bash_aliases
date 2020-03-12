# Typo
alias exti='exit'
alias eixt='exit'
alias exut='exit'

#
# CLI
#

alias a="atom"
alias c="code"

# Make sure aliases can be sudo'ed
alias sudo="sudo "

#
# Network
#

# Python server
alias server="python -m SimpleHTTPServer"
# Show active network listeners
alias netlisteners='lsof -i -P | grep LISTEN'
# Actives networks listeners
alias listen="lsof -i -P | grep LISTEN"
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

#
# Docker
#

alias dockerc="docker-compose"
alias dockerc-mysql-up="dockerc -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d mysql"
alias dockerc-mysql-down="dockerc -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop mysql"
alias dockerc-rabbitmq-up="dockerc -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d rabbitmq"
alias dockerc-rabbitmq-down="dockerc -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop rabbitmq"
alias dockerc-es-up="dockerc -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d elasticsearch"
alias dockerc-es-down="dockerc -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop elasticsearch"

#
# Yarn
#

# List linked packages
# https://github.com/yarnpkg/yarn/issues/1722#issuecomment-493079365
yarn-links () {
  current=$PWD

  for link in $(find $HOME/.config/yarn/link -type l)
  do
    cd $link"/../"$(readlink $link)
    echo $link $'\n==>' $PWD
  done

  cd $current
}

#
# NPM
#

alias npm-pre-publish="npm pack && tar -xvzf *.tgz"
