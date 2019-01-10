default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:alsa .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/snd:/dev/snd \
        --env ALSA_CARD=Speaker \
		--device=/dev/snd:/dev/snd \
		ubuntu:alsa

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/snd:/dev/snd \
        --env ALSA_CARD=Speaker \
		--device=/dev/snd:/dev/snd \
		ubuntu:alsa

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/snd:/dev/snd \
        --env ALSA_CARD=Speaker \
		--device=/dev/snd:/dev/snd \
		ubuntu:alsa
