YML=/home/jfrancai/inception/srcs/docker-compose.yml
DOCKER_COMPOSE=/usr/local/bin/docker-compose
DOCKER=/usr/bin/docker
SH=/bin/bash -c

compose: $(YML)
	$(DOCKER_COMPOSE) -f $(YML) up --build -d

down: $(YML)
	$(DOCKER_COMPOSE) -f $(YML) down

install: .install.sh
	./.install.sh

.PHONNY: compose down install
