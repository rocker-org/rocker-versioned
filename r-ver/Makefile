LATEST=3-3-2

latest:
	docker build --build-arg R_VERSION=3-3-2 -t rocker/r-ver .	

## Auto-generate separate Dockerfiles for auto builds by hub
sync: 3.3.2/Dockerfile 3.3.1/Dockerfile 3.3.0/Dockerfile 3.2.0/Dockerfile 3.1.1/Dockerfile

3.3.2/Dockerfile: Dockerfile
	export R_VERSION=3.3.2 export R_SVN=3-3-2 && unset BUILD_DATE && make update
3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 export R_SVN=3-3-1 && export BUILD_DATE=2016-10-31 && make update
3.3.0/Dockerfile: Dockerfile
	export R_VERSION=3.3.0 export R_SVN=3-3-0 && export BUILD_DATE=2016-05-03 && make update
3.2.0/Dockerfile: Dockerfile
	export R_VERSION=3.2.0 export R_SVN=3-2-0 && export BUILD_DATE=2016-10-31 && make update
## NOTE: MRAN goes back only to 2014-09-17, (during R 3.1.1; 3.1.2 was released in Oct 2014)
3.1.1/Dockerfile: Dockerfile
	export R_VERSION=3.1.1 export R_SVN=3-1-1 && export BUILD_DATE=2014-09-17 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/${LATEST}/${R_SVN}/' ${R_VERSION}/Dockerfile
	sed -i "s/ARG BUILD_DATE/ARG BUILD_DATE\nENV BUILD_DATE $$\{BUILD_DATE:-${BUILD_DATE}\}/" ${R_VERSION}/Dockerfile
	sed -i 's/## MRAN becomes default only in versioned images/  \&\& echo \"options\(repos=c\(CRAN=\x27$$MRAN\x27\)\)\" > \/usr\/local\/lib\/R\/etc\/Rprofile.site \\ /' ${R_VERSION}/Dockerfile

