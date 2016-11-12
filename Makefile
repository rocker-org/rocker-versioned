R_VERSION=3.3.2

r-ver: .PHONY 
	make -C r-ver/ latest
rstudio: .PHONY 
	docker build --build-arg RSTUDIO_VERSION=1.0.44 -t rocker/rstudio:${R_VERSION} rstudio/${R_VERSION}
tidyverse: .PHONY 
	docker build --build-arg BUILD_DATE=$(date -I) -t rocker/tidyverse:${R_VERSION} tidyverse/${R_VERSION}
verse: .PHONY 
	docker build -t rocker/verse:${R_VERSION} verse/${R_VERSION}

all: 
	make sync r-ver rstudio tidyverse verse

sync:
	cp rstudio/Dockerfile rstudio/${R_VERSION}/Dockerfile
	cp tidyverse/Dockerfile tidyverse/${R_VERSION}/Dockerfile
	cp verse/Dockerfile verse/${R_VERSION}/Dockerfile


.PHONY:
	echo "Building Rocker versioned images locally...\n"
