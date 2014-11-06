NAME=r-base-3.1.1

all: build

build: 
	docker build -t $(NAME) .


run-root: build 
	docker run -u docker -ti $(NAME) bash

run: build
	docker run -u docker -ti $(NAME) bash
