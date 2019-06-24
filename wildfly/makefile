default: build

build:
	docker build -t wildfly:my .
	docker run -it --rm \
		-p 8080:8080 \
		-p 8443:8443 \
		-p 9990:9990 \
		wildfly:my

run:
	docker run -it --rm \
		-p 8080:8080 \
		-p 8443:8443 \
		-p 9990:9990 \
		wildfly:my
