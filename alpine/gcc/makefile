default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t alpine:gcc .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/d/w/git:/home/saj/git \
		alpine:gcc
user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/d/w/git:/home/saj/git \
		alpine:gcc

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/d/w/git:/home/saj/git \
		alpine:gcc
