.PHONY: install test build run docker-build docker-up docker-down

install:
	@echo "No dependencies required"

test:
	bash test/test.sh

build:
	@test -f index.html
	@test -f css/style.css
	@test -f js/script.js
	@echo "Static application build verified"

run:
	python -m http.server $${PORT:-8000}

docker-build:
	docker build --tag pg-finder:local .

docker-up:
	docker compose up --build

docker-down:
	docker compose down