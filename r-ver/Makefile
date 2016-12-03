latest:
	docker build --build-arg R_VERSION=3-3-2 -t rocker/r-ver .	


## Using build-arg
all:
	docker build --build-arg R_VERSION=3-3-2 -t rocker/r-ver:3.3.2 .	
	docker build --build-arg R_VERSION=3-3-1 -t rocker/r-ver:3.3.1 .	
	docker build --build-arg R_VERSION=3-3-0 -t rocker/r-ver:3.3.0 .	
	docker build --build-arg R_VERSION=3-2-0 -t rocker/r-ver:3.2.0 .	
	docker build --build-arg R_VERSION=3-1-0 -t rocker/r-ver:3.1.0 .	
	docker build --build-arg R_VERSION=3-0-0 -t rocker/r-ver:3.0.0 .
	docker build --build-arg R_VERSION=2-15-0 -t rocker/r-ver:2.15.0 .


## Auto-generate separate Dockerfiles for auto builds by hub
sync: 3.3.2/Dockerfile 3.3.1/Dockerfile 3.3.0/Dockerfile 3.2.0/Dockerfile 3.1.0/Dockerfile 3.0.0/Dockerfile 2.15.0/Dockerfile

3.3.2/Dockerfile: Dockerfile
	cp Dockerfile 3.3.2/Dockerfile && sed -i s/3-3-2/3-3-2/ 3.3.2/Dockerfile
3.3.1/Dockerfile: Dockerfile
	cp Dockerfile 3.3.1/Dockerfile && sed -i s/3-3-2/3-3-1/ 3.3.1/Dockerfile
3.3.0/Dockerfile: Dockerfile
	cp Dockerfile 3.3.0/Dockerfile && sed -i s/3-3-2/3-3-0/ 3.3.0/Dockerfile
3.2.0/Dockerfile: Dockerfile
	cp Dockerfile 3.2.0/Dockerfile && sed -i s/3-3-2/3-3-0/ 3.2.0/Dockerfile
3.1.0/Dockerfile: Dockerfile
	cp Dockerfile 3.1.0/Dockerfile && sed -i s/3-3-2/3-1-0/ 3.1.0/Dockerfile
3.0.0/Dockerfile: Dockerfile
	cp Dockerfile 3.0.0/Dockerfile && sed -i s/3-3-2/3-0-0/ 3.0.0/Dockerfile
2.15.0/Dockerfile: Dockerfile
	cp Dockerfile 2.15.0/Dockerfile && sed -i s/3-3-2/2-15-0/ 2.15.0/Dockerfile









