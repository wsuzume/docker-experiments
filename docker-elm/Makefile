USERNAME=wsuzume

SOURCE=Dockerfile
IMAGE=${USERNAME}/ubuntu-elm:latest

# build container
.PHONY: build
build: Dockerfile
	docker image build -f ${SOURCE} -t ${IMAGE} .

.PHONY: push
push:
	docker push ${IMAGE}

.PHONY: pull
pull:
	docker pull ${IMAGE}

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
	docker container run -it --rm -p 8000:8000 \
		-v ${PWD}/src:/work/src \
		-v ${PWD}/bin:/work/bin \
		${IMAGE} \
		bash

elm: src/Main.elm
	docker container run --rm \
		-v ${PWD}/src:/work/src \
		-v ${PWD}/bin:/work/bin \
		${IMAGE} \
		elm make src/Main.elm --output=bin/main.js
	cp src/index.html bin/index.html

.PHONY: serve
# --init をつけないと Ctrl+C が利かない
serve:
	docker container run -it --init --rm -p 8000:8000 \
		-v ${PWD}/src:/work/src \
		-v ${PWD}/bin:/work/bin \
		-w /work/src \
		${IMAGE} \
		elm-live Main.elm --pushstate --host=0.0.0.0 -- --output=main.js
