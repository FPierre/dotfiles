# ⚠️ comment a line does not disable it in the autocompletion

# Port forward staging RabbitMQ: kubectl port-forward -n rabbitmq service/rabbitmq 5675:5672

abbr -a exti exit
abbr -a gti git

abbr -a bat batcat

abbr -a dockerc docker-compose

# Start µ in shared env with `pierref` debug token
abbr -a pierref "CAROTTE_DEBUG_TOKEN=pierref make run"

abbr -a rabbitmq-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d rabbitmq'
abbr -a rabbitmq-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop rabbitmq'

abbr -a elasticsearch-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/elasticsearch.yml up -d'
abbr -a elasticsearch-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/elasticsearch.yml stop'

abbr -a sftp-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d sftp'
abbr -a sftp-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop sftp'

abbr -a staging "gcloud container clusters get-credentials staging --zone=europe-west1-b --project=staging2-284609"
abbr -a production "gcloud container clusters get-credentials production --region=europe-west3 --project=infra-195110"

abbr -a mysql-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d mysql'
abbr -a mysql-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop mysql'

abbr -a postgresql-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d postgres'
abbr -a postgresql-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop postgres'

abbr -a mongodb-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml up -d mongodb'
abbr -a mongodb-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/datasources.yml stop mongodb'

abbr -a zeebe-up 'docker-compose -f ~/Workspace/infra/infra-docker-compose/camunda-operate/docker-compose.yml up -d'
abbr -a zeebe-down 'docker-compose -f ~/Workspace/infra/infra-docker-compose/camunda-operate/docker-compose.yml stop'

abbr -a npm-pre-publish "npm pack && tar -xvzf *.tgz"

abbr -a terraform012 "/opt/terraform-0-12-29/terraform"
