latest:
	docker build -t rocker/tidyverse .

sync: 
	make devel/Dockerfile 3.4.0/Dockerfile 

devel/Dockerfile: Dockerfile
	export R_VERSION=devel && make update
3.4.0/Dockerfile: Dockerfile
	export R_VERSION=3.4.0 && make update

## Older Dockerfiles remain based on jessie, do not sync

3.3.3/Dockerfile: Dockerfile
	export R_VERSION=3.3.3 && make update
3.3.2/Dockerfile: Dockerfile
	export R_VERSION=3.3.2 && make update
3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/rstudio:latest/rstudio:${R_VERSION}/' ${R_VERSION}/Dockerfile

build:
	docker build -t rocker/tidyverse:${R_VERSION} ${R_VERSION}

clean:
	rm  3.*.*/Dockerfile

