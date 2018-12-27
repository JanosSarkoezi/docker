default: build

build:
	docker build -t nvim:ppa .
	docker run -it \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		nvim:ppa
run:
	docker run -it \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		nvim:ppa
