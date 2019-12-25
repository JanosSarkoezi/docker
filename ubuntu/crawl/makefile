default: build

build:
	docker build -t crawl .
	docker run --name crawl \
		-d -p 80:80 \
		-v /tmp/data/:/data \
		crawl

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		alpine:crawl

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		alpine:crawl
