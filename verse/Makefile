latest:
	docker build -t rocker/verse -f latest.Dockerfile .
	export VERSION=`cat latest.Dockerfile | head -n1 | sed 's/.*\([0-9].[0-9].[0-9]\)/\1/'` && docker tag rocker/verse rocker/verse:"$$VERSION"
	

all:
	docker build -t rocker/verse:3.6.0 -f 3.6.0.Dockerfile .
	docker build -t rocker/verse:3.5.0 -f 3.5.0.Dockerfile .
	docker build -t rocker/verse:3.4.0 -f 3.4.0.Dockerfile .

