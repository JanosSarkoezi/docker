default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:mutt .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:mutt

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:mutt

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:mutt
