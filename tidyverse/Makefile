latest:
	docker build -t rocker/tidyverse .

sync: 
	make 3.3.2 3.3.1

3.3.2/Dockerfile: Dockerfile
	export R_VERSION=3.3.2 && make update
3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/rstudio:latest/rstudio:${R_VERSION}/' ${R_VERSION}/Dockerfile

build:
	docker build --build-arg BUILD_DATE=${BUILD_DATE} -t rocker/tidyverse:${R_VERSION} ${R_VERSION}

