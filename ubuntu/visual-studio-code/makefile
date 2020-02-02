default: build

build:
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) \
		-t ubuntu:visual-studio-code .
	docker run -it --rm \
		--user $(shell id -u) \
		-e DISPLAY=$$DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/dev/java/ide/vscode:/home/vscode \
		-v /home/saj/dev/git:/home/vscode/git \
		--privileged \
		ubuntu:visual-studio-code

java:
	docker run -it --rm \
		--user $(shell id -u) \
		-e DISPLAY=$$DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/dev/java/ide/vscode:/home/vscode \
		-v /home/saj/dev/git:/home/vscode/git \
		--privileged \
		ubuntu:visual-studio-code

cpp:
	docker run -it --rm \
		--user $(shell id -u) \
		-e DISPLAY=$$DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /home/saj/dev/cpp/ide/vscode:/home/vscode \
		-v /home/saj/dev/git:/home/vscode/git \
		--privileged \
		ubuntu:visual-studio-code
