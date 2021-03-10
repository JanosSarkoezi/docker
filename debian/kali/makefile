default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t debian:my-kali .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(shell pwd):/home/saj/sandbox \
		debian:my-kali

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(shell pwd):/home/saj/sandbox \
		debian:my-kali

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(shell pwd):/home/saj/sandbox \
		debian:my-kali
