abbr -a exti exit
abbr -a gti git

abbr -a dockerc docker-compose

# Start µ in shared env with `pierref` debug token
abbr -a pierref "CAROTTE_DEBUG_TOKEN=pierref make run"

# Start SSH tunnel to connect to SSH bastion
abbr -a ssh-tunnel-up_OLD2 "ssh -L 3307:database-main-read.private-staging.playship.co:3306 -L 5673:rabbit.private-staging.playship.co:5672 pierre_flauder_cubyn_com@bastion-staging.playship.co/qsclgrnm"
abbr -a ssh-tunnel-up_OLD "ssh -L 3307:db-staging.private.cubyn.com:3306 -L 5673:broker-staging.private.cubyn.com:5672 pierre_flauder_cubyn_com@bastion-prod.playship.co"

abbr -a rabbitmq-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d rabbitmq'
abbr -a rabbitmq-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop rabbitmq'

abbr -a elasticsearch-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/elasticsearch.yml up -d'
abbr -a elasticsearch-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/elasticsearch.yml stop'

abbr -a sftp-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d sftp'
abbr -a sftp-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop sftp'

abbr -a staging "gcloud container clusters get-credentials staging --zone europe-west1-b --project staging2-284609"
abbr -a production "gcloud beta container clusters get-credentials production --region europe-west3 --project infra-195110"

abbr -a mysql-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d mysql'
abbr -a mysql-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop mysql'

abbr -a mysql-up-production '/opt/cloud_sql_proxy -instances=infra-195110:europe-west3:production-6=tcp:33061 -credential_file=/home/pierre/.cloudsql-credentials.json'
abbr -a mysql-up-bi '/opt/cloud_sql_proxy -instances=infra-195110:europe-west3:bi-prod-1=tcp:33062 -credential_file=/home/pierre/.cloudsql-credentials.json'

abbr -a npm-pre-publish "npm pack && tar -xvzf *.tgz"
