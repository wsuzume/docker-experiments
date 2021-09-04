SOURCE=Dockerfile
IMAGE=wsuzume/docker-nginx-dummy-server:latest


# build container image
.PHONY: image
image: Dockerfile
	docker image build -f ${SOURCE} -t ${IMAGE} .

.PHONY: pull
pull:
	docker pull ${IMAGE}

.PHONY: push
push:
	docker push ${IMAGE}

# clean up all stopped containers
.PHONY: clean
clean:
	docker container prune

# delete all image
.PHONY: doomsday
doomsday:
	docker image rm -f `docker image ls -q`

# create new container and login to the shell
.PHONY: shell
shell:
	docker container run -it --rm \
		-p 80:80 \
		-v ${PWD}/letsencrypt:/etc/letsencrypt \
		-v ${PWD}/conf.d:/etc/nginx/conf.d \
		${IMAGE} \
		bash

.PHONY: run
run:
	docker-compose -p services \
		-f docker-compose.yml \
		up --remove-orphans

.PHONY: rund
rund:
	docker-compose -p services \
		-f docker-compose.yml \
		up -d --remove-orphans

PHONY: stopd
stopd:
	docker-compose -p services \
		-f docker-compose.yml \
		down

.PHONY: local_run
local_run:
	docker-compose -p services \
		-f docker-compose.yml \
		-f docker-compose.local.yml \
		up --remove-orphans
