# Makefile for docker env

DEV_UID=`id -u`
PHP_SERVICE=php

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  start              Start   docker containers"
	@echo "  restart            Restart docker containers"
	@echo "  build              Build docker containers"
	@echo "  recreate           Recreate docker containers"
	@echo "  bash               Enter to php container's console"
	@echo "  root               Enter to php container's console as root user (to install libs etc.)"

start:
	@docker-compose up -d

build:
	@docker-compose down --rmi all
	@docker-compose build --build-arg UID=$(DEV_UID) $(PHP_SERVICE)

restart:
	@docker-compose stop
	@docker-compose up -d

bash:
	@docker-compose exec $(PHP_SERVICE) bash
	
root:
	@docker-compose exec --user root $(PHP_SERVICE) bash

recreate:
	@docker-compose up -d --force-recreate