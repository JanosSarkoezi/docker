default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:vim.java .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:vim.java
user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:vim.java

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ubuntu:vim.java
