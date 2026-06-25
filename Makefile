.PHONY: install run test lint format clean docker down

install:
	pip install -e .

run:
	uvicorn apps.api_gateway.main:app --reload --host 0.0.0.0 --port 8000

test:
	pytest tests/

lint:
	ruff check .

format:
	black .

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

docker:
	docker compose up --build

down:
	docker compose down
	