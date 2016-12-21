latest: 
	docker build -t rocker/verse .

sync: 
	make 3.3.2/Dockerfile 3.3.1/Dockerfile


3.3.2/Dockerfile: Dockerfile
	export R_VERSION=3.3.2 && make update

3.3.1/Dockerfile: Dockerfile
	export R_VERSION=3.3.1 && make update

update:
	cp Dockerfile ${R_VERSION}/Dockerfile
	sed -i 's/tidyverse:latest/tidyverse:${R_VERSION}/' ${R_VERSION}/Dockerfile

