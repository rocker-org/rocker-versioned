latest: 
	docker build -t rocker/verse .

sync: 
	make devel/Dockerfile 3.4.0/Dockerfile

devel/Dockerfile: Dockerfile
	export R_VERSION=devel && make update
3.4.0/Dockerfile: Dockerfile
	export R_VERSION=3.4.0 && make update

## Do not sync older Dockerfiles

3.3.3/Dockerfile: Dockerfile
	export R_VERSION=3.3.3 && make update
3.3.2/Dockerfile: Dockerfile
	export R_VERSION=3.3.2 && make update
3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/tidyverse:latest/tidyverse:${R_VERSION}/' ${R_VERSION}/Dockerfile


clean:
	rm 3.*.*/Dockerfile devel/Dockerfile 
