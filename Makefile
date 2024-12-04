
.PHONY: help up down clean

help: Makefile ## Prints this help message.
	@grep -h "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/:.*##/#/' | column -c 2 -t -s#

up: ## Starts services.
	@echo --- fixing directories
	@sudo mkdir -pv data/grafana/data
	@sudo mkdir -pv data/prometheus/data
	@sudo chown -cR 472 data/grafana/
	@sudo chown -cR 65534:65534 data/prometheus/

	@echo --- starting services
	docker compose up -d

down: ## Stops services.
	@echo --- stopping services
	docker compose down

clean: down ## Stops services and deletes data directories.
	@echo --- clearing data
	@sudo rm -rvf data/grafana/data/
	@sudo rm -rvf data/prometheus/data/
