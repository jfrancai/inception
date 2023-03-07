NAME=inception
PATH=./srcs/
DOCKER_COMPOSE=/usr/local/bin/docker-compose
DOCKER=/usr/bin/docker
SH=/bin/bash -c
$(MAKE)=/usr/bin/make

compose: $(PATH)docker-compose.yml
	$(SH) "cd $(PATH) && $(DOCKER_COMPOSE) up -d"

down: $(PATH)docker-compose.yml
	$(SH) "cd $(PATH) && $(DOCKER_COMPOSE) down"

rm:
	@$(SH) "cd $(PATH) && $$($(DOCKER) rm $$($(DOCKER) ps -aq))"

rmf:
	@$(SH) "cd $(PATH) && $$($(DOCKER) rm -f $$($(DOCKER) ps -aq))"

rmi:
	@$(SH) "cd $(PATH) && $$($(DOCKER) rmi $$($(DOCKER) images -aq))"

prune:
	$(SH) "cd $(PATH) && $(DOCKER) system prune -a"

clean:
	@$(SH) "cd $(PATH) && $(DOCKER) volume rm $$($(DOCKER) volume ls -q)"

.PHONNY: compose down rm rmi prune clean fclean re
