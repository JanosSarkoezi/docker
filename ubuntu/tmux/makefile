default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:tmux .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:tmux

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:tmux

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:tmux
