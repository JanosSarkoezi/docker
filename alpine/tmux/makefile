default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t alpine:tmux .
	docker run -it \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		alpine:tmux
run:
	docker run -it \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		alpine:tmux
