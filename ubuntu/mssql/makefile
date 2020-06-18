default: run

run:
	docker run --rm \
		-e 'ACCEPT_EULA=Y' \
		-e 'SA_PASSWORD=Bla%Test1' \
		--cap-add SYS_PTRACE \
		-u $$(id -u saj):$$(id -g saj) \
		-v /home/saj/dev/mssql:/var/opt/mssql \
		-p 1433:1433 \
		mcr.microsoft.com/mssql/server:latest
