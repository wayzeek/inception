# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vcart <vcart@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/28 12:34:24 by vcart             #+#    #+#              #
#    Updated: 2023/11/28 14:07:09 by vcart            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color codes
_END = $(shell printf "\033[0m")
_BOLD = $(shell printf "\033[1m")
_GREY = $(shell printf "\033[30m")
_RED = $(shell printf "\033[31m")
_GREEN = $(shell printf "\033[32m")
_YELLOW = $(shell printf "\033[33m")
_BLUE = $(shell printf "\033[34m")
_PURPLE = $(shell printf "\033[35m")
_CYAN = $(shell printf "\033[36m")
_WHITE = $(shell printf "\033[37m")

# Default target
all: up

# Mount each docker and run them
up:
	@echo "$(_BOLD)$(_GREEN)Running Docker containers...$(_END)"
	@mkdir -p ${HOME}/data
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@sudo sh -c 'echo "127.0.0.1 vcart.42.fr" >> /etc/hosts && echo "Successfully added vcart.42.fr to /etc/hosts"'
	@docker compose -f ./srcs/docker-compose.yml up --detach

# Unmount dockers
down:
	@echo "$(_BOLD)$(_RED)Stopping all containers...$(_END)"
	@docker compose -f ./srcs/docker-compose.yml down

# Build the dockers
build:
	@echo "$(_BOLD)$(_GREEN)Running Docker containers...$(_END)"
	@docker compose -f srcs/docker-compose.yml up --detach --build

# Clean the dockers installation
clean:
	@echo "$(_BOLD)$(_RED)Removing all containers...$(_END)"
	@docker stop nginx wordpress mariadb 2>/dev/null || true
	@docker rm nginx wordpress mariadb 2>/dev/null || true
	@docker volume rm db wp 2>/dev/null || true
	@docker rmi srcs-nginx srcs-wordpress srcs-mariadb 2>/dev/null || true
	@docker network rm inception_net 2>/dev/null || true
	sudo rm -rf ${HOME}/data
	@sudo sed -i '/127.0.0.1 vcart.42.fr/d' /etc/hosts && echo "vcart.42.fr removed in /etc/hosts"

# Purge all cached data of dockers
purge:	down clean
	@docker system prune --all

# Restart the docker build
re: clean all

# Rules
.PHONY: all up down build clean purge re