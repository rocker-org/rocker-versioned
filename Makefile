r-ver: .PHONY
	make -C base/ latest
rstudio: .PHONY 
	docker build --build-arg RSTUDIO_VERSION=1.0.44 -t rocker/rstudio:3.3.2 rstudio
tidyverse: .PHONY 
	docker build --build-arg BUILD_DATE=$(date -I) -t rocker/tidyverse:3.3.2 tidyverse

all: tidyverse-3.3.2

.PHONY:
	pwd
