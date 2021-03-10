default: build

build:
	docker build -t crawl .
	docker run --name crawl -it --rm \
		-p 80:80 \
		-v /home/saj/dev/git/games/crawlm/data/:/data \
		-v /home/saj/dev/git/games/crawlm/rcs/:/root/crawl/crawl-ref/source/rcs \
		crawl

user:
	docker run -it --rm \
		--user=$(shell id -u):$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		crawl

run:
	docker run --name crawl -it --rm \
		-p 80:80 \
		-v /home/saj/dev/git/games/crawlm/data/:/data \
		-v /home/saj/dev/git/games/crawlm/rcs/:/root/crawl/crawl-ref/source/rcs \
		crawl
