all: build push
update:
	docker build -t geodns .
	docker tag -f geodns docker.sunet.se/geodns
build:
	docker build --no-cache=true -t geodns .
	docker tag -f geodns docker.sunet.se/geodns
push:
	docker push docker.sunet.se/geodns
