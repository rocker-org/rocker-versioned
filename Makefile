r-ver: .PHONY
	make -C r-ver/ latest
rstudio: 
	docker build --build-arg RSTUDIO_VERSION=1.0.44 -t rocker/rstudio:3.3.2 rstudio
tidyverse: .PHONY 
	docker build --build-arg BUILD_DATE=$(date -I) -t rocker/tidyverse:3.3.2 tidyverse
verse: .PHONY
	docker build -t rocker/verse:3.3.2 verse

all: 
	make r-ver rstudio tidyverse verse

.PHONY:
	echo "Building Rocker versioned images locally...\n"
