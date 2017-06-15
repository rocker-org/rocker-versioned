LATEST=3.4.0
## Also update this in default Dockerfile on new version release!!

latest:
	docker build --build-arg R_VERSION=${LATEST} -t rocker/r-ver .	

## Auto-generate separate Dockerfiles for auto builds by hub
sync: devel/Dockerfile 3.4.0/Dockerfile


3.4.0/Dockerfile: Dockerfile
	export R_VERSION=3.4.0 && unset BUILD_DATE && make update


## Custom configuration for devel 

devel/Dockerfile: Dockerfile
	cp Dockerfile devel/Dockerfile 
	sed -i 's/tcl8\.6-dev/subversion tcl8.6-dev/' devel/Dockerfile
	sed -i 's/curl -O .*\.gz/svn co https:\/\/svn\.r-project.org\/R\/trunk R-devel/' devel/Dockerfile
	sed -i 's/.*tar -xf R-.*//' devel/Dockerfile
	sed -i 's/cd R-.*/cd R-devel \\/' devel/Dockerfile

####### These are frozen now to debian:jessie images and should not be updated further!

3.3.3/Dockerfile: Dockerfile
	export R_VERSION=3.3.3 && export BUILD_DATE=2017-04-21 && make update
3.3.2/Dockerfile: Dockerfile
	export R_VERSION=3.3.2 && export BUILD_DATE=2017-03-06 && make update
3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 && export BUILD_DATE=2016-10-31 && make update
3.3.0/Dockerfile: Dockerfile
	export R_VERSION=3.3.0 && export BUILD_DATE=2016-06-21 && make update
## NOTE: This uses Build Date of the last day of version 3.2.0, e.g. day 3.2.1 was released
3.2.0/Dockerfile: Dockerfile
	export R_VERSION=3.2.0 && export BUILD_DATE=2015-06-18 && make update && make use-curl
## NOTE: MRAN goes back only to 2014-09-17, (during R 3.1.1; 3.1.2 was released in Oct 2014)
## Also NOTE: littler not avialable before 2015-10-29 
3.1.0/Dockerfile: Dockerfile
	export R_VERSION=3.1.0 && export BUILD_DATE=2014-09-17 && make update && make use-curl

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/${LATEST}/${R_VERSION}/' ${R_VERSION}/Dockerfile
	sed -i "s/ARG BUILD_DATE/ARG BUILD_DATE\nENV BUILD_DATE $$\{BUILD_DATE:-${BUILD_DATE}\}/" ${R_VERSION}/Dockerfile
	sed -i 's/## MRAN becomes default only in versioned images/\&\& echo \"options\(repos = c\(CRAN=\x27$$MRAN\x27\), download.file.method = \x27libcurl\x27\)\" >> \/usr\/local\/lib\/R\/etc\/Rprofile.site \\/' ${R_VERSION}/Dockerfile

## libcurl not an option before 3.3.0, https support requires curl
use-curl:
	sed -i "s/'libcurl'/'curl'/g" ${R_VERSION}/Dockerfile
	sed -i 's/curl \\/\\/' ${R_VERSION}/Dockerfile
	sed -i 's/ca-certificates/ca-certificates curl/' ${R_VERSION}/Dockerfile

clean:
	rm  3.*/Dockerfile

