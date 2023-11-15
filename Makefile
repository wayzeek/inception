# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vcart <vcart@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/14 11:34:06 by vcart             #+#    #+#              #
#    Updated: 2023/11/14 17:19:30 by vcart            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
NGINX_CONTAINER_NAME = nginx-container
NGINX_IMAGE_NAME = nginx-image

DOMAIN_NAME = vcart.42.fr

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
all: build run

# Build the Docker image
build:
	@echo "$(_BOLD)$(_GREEN)Building Docker image...$(_END)"
	docker build -t $(NGINX_IMAGE_NAME) ./srcs/requirements/nginx

# Run the Docker container
run:
	@echo "$(_BOLD)$(_GREEN)Running Docker container...$(_END)"
	docker run -d -p 443:443 -v $(shell pwd)/.certif/certs:/etc/ssl/certs:ro --name $(NGINX_CONTAINER_NAME) $(NGINX_IMAGE_NAME)

# Clean all
fclean:
	@echo "$(_BOLD)$(_RED)Stopping all containers...$(_END)"
	docker stop $(shell docker ps -a -q)
	@echo "$(_BOLD)$(_RED)Removing all containers...$(_END)"
	docker rm $(shell docker ps -a -q)

.SILENT: all build run fclean

.PHONY: all build run fclean