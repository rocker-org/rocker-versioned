latest: .PHONY 
	export BUILD_DATE=$(date -I --date='TZ="America/Los_Angeles"') && docker build --build-arg BUILD_DATE=${BUILD_DATE} -t rocker/tidyverse .

sync: 
	make 3.3.2 3.3.1

## Since 3.3.2 == latest, use most recent date to pin MRAN 
3.3.2: .PHONY 
	export R_VERSION=3.3.2 && unset BUILD_DATE && make update

## NOTE: BUILD_DATE corresponds to last day for which version was current
3.3.1: .PHONY 
	export R_VERSION=3.3.1 && export BUILD_DATE=2016-10-31 && make update


## Note: Last line uses some crazy sed escaping to set repo to MRAN in Rprofile
update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/rstudio:latest/rstudio:${R_VERSION}/' ${R_VERSION}/Dockerfile
	sed -i "s/ARG BUILD_DATE/ARG BUILD_DATE\nENV BUILD_DATE $$\{BUILD_DATE:-${BUILD_DATE}\}/" ${R_VERSION}/Dockerfile
	sed -i 's/## MRAN becomes default only in versioned images/  \&\& echo \"options\(repos=c\(CRAN=\x27$$MRAN\x27\)\)\" > \/usr\/local\/lib\/R\/Rprofile.site \\ /' ${R_VERSION}/Dockerfile


build:
	docker build --build-arg BUILD_DATE=${BUILD_DATE} -t rocker/tidyverse:${R_VERSION} ${R_VERSION}

.PHONY:
	echo "Syncing tidyverse images...\n"


## NOTE: MRAN goes back only to 2014-09-17, (during R 3.1.1; 3.1.2 was released in Oct 2014)
