latest:
	docker build -t rocker/rstudio -f latest.Dockerfile .
	export VERSION=`cat latest.Dockerfile | head -n1 | sed 's/.*\([0-9].[0-9].[0-9]\)/\1/'` && docker tag rocker/rstudio rocker/rstudio:"$$VERSION"
	

all:
	docker build -t rocker/rstudio:3.6.0 -f 3.6.0.Dockerfile .
	docker build -t rocker/rstudio:3.5.0 -f 3.5.0.Dockerfile .
	docker build -t rocker/rstudio:3.4.0 -f 3.4.0.Dockerfile .

