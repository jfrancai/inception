PATH=./srcs/
DOCKER_COMPOSE=/usr/local/bin/docker-compose
DOCKER=/usr/bin/docker
SH=/bin/bash -c

compose: $(PATH)docker-compose.yml
	$(SH) "cd $(PATH) && $(DOCKER_COMPOSE) up -d"

down: $(PATH)docker-compose.yml
	$(SH) "cd $(PATH) && $(DOCKER_COMPOSE) down"

prune:
	$(SH) "cd $(PATH) && $(DOCKER) system prune -a"

.PHONNY: compose down prune
