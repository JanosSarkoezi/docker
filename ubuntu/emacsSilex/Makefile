default: run
run:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:emacs2 .
	docker run -it \
		-e DISPLAY \
		--user=$(shell id -u):$(shell id -g) \
		-v ~/dev/ide/emacs/.emacs.d:/home/saj/.emacs.d \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ~/dev/:/home/saj/dev/ \
		-v ~/.local/share/fonts/:/home/saj/.local/share/fonts \
		ubuntu:emacs2

user:
	docker run -it \
		-e DISPLAY \
		--user=$(shell id -u):$(shell id -g) \
		-v ~/dev/ide/emacs/.emacs.d:/home/saj/.emacs.d \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ~/dev/:/home/saj/dev/ \
		ubuntu:emacs2
term:
	docker run -it \
		--user=$(shell id -u):$(shell id -g) \
		-v ~/dev/ide/emacs/.emacs.d:/home/saj/.emacs.d \
		-v ~/dev/:/home/saj/dev/ \
		ubuntu:emacs2
