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

build:
	@docker-compose down --rmi all
	@docker-compose build --build-arg UID=$(DEV_UID) $(PHP_SERVICE)

restart:
	@docker-compose restart

bash:
	@docker-compose exec $(PHP_SERVICE) bash

recreate:
	@docker-compose up -d --force-recreate