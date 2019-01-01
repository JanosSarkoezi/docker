default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t alpine:texlive-chess .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/d/w/git:/home/saj/git \
		alpine:texlive-chess
run:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/d/w/git:/home/saj/git \
		alpine:texlive-chess
