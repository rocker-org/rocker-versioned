NAME=r-base-2.12.0

all: build

build: 
	docker build -t $(NAME) .


run: build
	docker run -ti $(NAME) bash
