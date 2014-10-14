## Install from debian:squeeze, installs R 2.11.1, then gets the binares for 2.12
FROM debian:6.0

RUN apt-get update  && apt-get install -y --no-install-recommends \
    r-base \
    r-base-dev \
    r-recommended \
    vim-tiny \
    wget 

## Set a default user. Available via runtime flag `--user docker` 
## and add user to 'staff' group, granting them write privileges
## to /usr/local/lib/R/site.library

RUN wget http://snapshot.debian.org/archive/debian/20101016T044154Z/pool/main/r/r-base/r-base-core_2.12.0-1_amd64.deb \
&& wget http://snapshot.debian.org/archive/debian/20101016T044154Z/pool/main/r/r-base/r-recommended_2.12.0-1_all.deb \
&& wget http://snapshot.debian.org/archive/debian/20101016T044154Z/pool/main/r/r-base/r-base_2.12.0-1_all.deb \
&& dpkg -i r-base-core_*.deb \
&& dpkg -i r-recommended_*.deb \
&& dpkg -i r-base_*.deb \
&& rm *.deb


#http://snapshot.debian.org/archive/debian/20101016T044154Z/pool/main/r/r-base/r-mathlib_2.12.0-1_amd64.deb
#http://snapshot.debian.org/archive/debian/20101016T044154Z/pool/main/r/r-base/r-base-dev_2.12.0-1_all.deb

RUN useradd docker


