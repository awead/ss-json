.PHONY: help

PWD="$(pwd)"
SSH_PRIVATE_KEY=$(shell cat ~/.ssh/id_rsa|base64)

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

exec: ## pop a shell in this thing
	docker-compose exec web /bin/bash

bundle: ## run bundle install in container
	docker-compose exec web bundle install

down: ## turn this thing off
	docker-compose down
	mutagen terminate --label-selector app=etda-workflow

up: ## run this thing
	docker-compose up -d
	mutagen create --ignore .git --ignore vendor --ignore vendor/cache --ignore tmp --ignore public -m two-way-resolved --label app=ss-json . docker://ss-json_web_1/app

rebuild: build up ## run build and then up

build: ## run development environment
	docker-compose build

yarn: ## Run Yarn
	docker run -v $$PWD:/code -w=/code node:10 'yarn'

attach: ## Attach to the web container
	docker attach etda_workflow_web_1

logs: ## watch logs
	docker-compose logs -f

rspec: ## test
	docker-compose exec -e RAILS_ENV=test web rspec

restart: ## restart rails server
	docker-compose exec web rails restart

console: ## boot-up rails console
	docker-compose exec web rails c
