R_VERSION=3.3.2
BUILD_DATE=2016-11-08

all: 
	make sync r-ver rstudio tidyverse verse

r-ver: .PHONY 
	make -C r-ver/ latest
rstudio: .PHONY 
	docker build --build-arg RSTUDIO_VERSION=1.0.44 -t rocker/rstudio:${R_VERSION} rstudio/${R_VERSION}
tidyverse: .PHONY 
	docker build --build-arg BUILD_DATE=$(date -I --date='TZ="America/Los_Angeles"') -t rocker/tidyverse:${R_VERSION} tidyverse/${R_VERSION}
verse: .PHONY 
	docker build -t rocker/verse:${R_VERSION} verse/${R_VERSION}

sync:
	make -C r-ver/ dockerfiles
	cp rstudio/Dockerfile rstudio/${R_VERSION}/Dockerfile
	cp tidyverse/Dockerfile tidyverse/${R_VERSION}/Dockerfile
	sed -i "s/ARG BUILD_DATE/ARG BUILD_DATE\nENV BUILD_DATE $$\{BUILD_DATE:-${BUILD_DATE}\}/" tidyverse/${R_VERSION}/Dockerfile
	cp verse/Dockerfile verse/${R_VERSION}/Dockerfile
	sed -i 's/tidyverse:latest/tidyverse:${R_VERSION}/' verse/${R_VERSION}/Dockerfile

.PHONY:
	echo "Building Rocker versioned images locally...\n"

