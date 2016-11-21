latest: .PHONY 
	export: BUILD_DATE=$(date -I --date='TZ="America/Los_Angeles"')
	docker build --build-arg BUILD_DATE=${BUILD_DATE} -t rocker/tidyverse .

sync: 
	make 3.3.2 3.3.1

3.3.2: .PHONY 
	export R_VERSION=3.3.2 && export BUILD_DATE=2016-11-08 && make update

3.3.1: .PHONY 
	export R_VERSION=3.3.1 && export BUILD_DATE=2016-10-31 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/rstudio:latest/rstudio:${R_VERSION}/' ${R_VERSION}/Dockerfile
	sed -i "s/ARG BUILD_DATE/ARG BUILD_DATE\nENV BUILD_DATE $$\{BUILD_DATE:-${BUILD_DATE}\}/" ${R_VERSION}/Dockerfile


build:
	docker build --build-arg BUILD_DATE=${BUILD_DATE} -t rocker/tidyverse:${R_VERSION} ${R_VERSION}

.PHONY:
	echo "Syncing tidyverse images...\n"

