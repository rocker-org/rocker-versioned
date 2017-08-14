latest: 
	docker build -t rocker/rstudio .

## Example with build-arg
#	docker build --build-arg RSTUDIO_VERSION=1.0.44 -t rocker/rstudio .

sync: 
	make devel/Dockerfile 3.4.1/Dockerfile

## DO NOT SYNC versions older than 3.4.0, they are frozen to jessie

## FIXME consider locking RSTUDIO_VERSION and/or PANDOC_VERSION based on release date as well

devel/Dockerfile: Dockerfile
	export R_VERSION=devel && make update
3.4.1/Dockerfile: Dockerfile
	export R_VERSION=3.4.1 && make update
3.4.0/Dockerfile: Dockerfile 
	export R_VERSION=3.4.0 && make update
3.3.3/Dockerfile: Dockerfile 
	export R_VERSION=3.3.3 && make update
3.3.2/Dockerfile: Dockerfile 
	export R_VERSION=3.3.2 && make update
3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	cp userconf.sh ${R_VERSION}/userconf.sh
	cp add_shiny.sh ${R_VERSION}/add_shiny.sh
	cp post_push ${R_VERSION}/hooks/post_push
	sed -i 's/r-ver:latest/r-ver:${R_VERSION}/' ${R_VERSION}/Dockerfile

hooks_update:
	echo ./*/hooks/ | xargs -n 1 cp post_push

build:
	docker build -t rocker/rstudio:${R_VERSION} ${R_VERSION}


.PHONY:
	echo "Syncing rstudio images...\n"

clean:
	rm  3.*/Dockerfile
	rm  3.*/hooks/post_push

