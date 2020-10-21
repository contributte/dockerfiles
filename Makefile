.PHONY: build dev bash

build:
	docker build -t planette/nette sandbox

dev:
	docker run -it --rm -p 8000:80 --name planette-nette planette/nette

bash:
	docker exec -it planette-nette bash
