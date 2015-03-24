NAME=r-base-2.15.1

all: build

build: 
	docker build -t $(NAME) .


run: build
	docker run -ti $(NAME) bash