default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:chromium .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/snd:/dev/snd \
		-e DISPLAY=$$DISPLAY \
		-e ALSA_CARD=Speaker \
		--device=/dev/snd:/dev/snd \
		--net host \
		ubuntu:chromium

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/snd:/dev/snd \
		-e DISPLAY=$$DISPLAY \
		--device=/dev/snd:/dev/snd \
#		--device=/dev/dri:/dev/dri \
#		-v /dev/shm:/dev/shm \
		--net host \
		ubuntu:chromium

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/snd:/dev/snd \
		-e DISPLAY=$$DISPLAY \
		--device=/dev/snd:/dev/snd \
		-v /dev/shm:/dev/shm \
		--net host \
		ubuntu:chromium
