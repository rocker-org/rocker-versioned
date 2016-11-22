latest: 
	docker build --build-arg RSTUDIO_VERSION=1.0.44 -t rocker/rstudio .

sync: 
	make 3.3.2 3.3.1


## FIXME consider setting RSTUDIO_VERSION and PANDOC_VERSION based on release date as well

3.3.2: .PHONY
	export R_VERSION=3.3.2 && make update

3.3.1: .PHONY
	export R_VERSION=3.3.1 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	cp userconf.sh ${R_VERSION}/userconf.sh
	sed -i 's/r-ver:latest/r-ver:${R_VERSION}/' ${R_VERSION}/Dockerfile


build:
	docker build -t rocker/rstudio:${R_VERSION} ${R_VERSION}


.PHONY:
	echo "Syncing rstudio images...\n"

