default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:emacs .
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
		-v /etc/machine-id:/etc/machine-id:ro \
		-e DISPLAY=:0 \
		ubuntu:emacs

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
		-v /etc/machine-id:/etc/machine-id:ro \
		-e DISPLAY=:0 \
		ubuntu:emacs

run:
	docker run -it --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
		-v /etc/machine-id:/etc/machine-id:ro \
		-e DISPLAY=:0 \
		ubuntu:emacs
