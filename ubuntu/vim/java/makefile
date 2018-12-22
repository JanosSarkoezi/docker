default: build

build:
	docker build -t vim:java .
	docker run -it \
		--user=$(id -u):$(id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		vim:java
run:
	docker run -it \
		--user=$(id -u):$(id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		vim:java
