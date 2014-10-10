## Install from debian:squeeze, R 2.11.1

FROM debian:squeeze
RUN apt-get update  && apt-get install -y --no-install-recommends \
    r-base \
    r-base-dev \
    r-recommended \
    vim-tiny \
    wget 

## Set a default user. Available via runtime flag `--user docker` 
## and add user to 'staff' group, granting them write privileges
## to /usr/local/lib/R/site.library

RUN useradd docker
RUN addgroup docker staff


