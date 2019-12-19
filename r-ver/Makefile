
latest: 
	docker build -t rocker/r-ver:latest -f latest.Dockerfile .
	export VERSION=`sed -n 's|.*R_VERSION:-\([0-9]\.[0-9]\.[0-9]\).*|\1|p' latest.Dockerfile` && docker tag rocker/r-ver:latest rocker/r-ver:"$${VERSION}"


