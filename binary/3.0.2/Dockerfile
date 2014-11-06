## Emacs, make this -*- mode: sh; -*-
### Rocker 3.0.2-1 - debian snapshot 20140711

## use a fixed debian version for reproducibility
FROM debian:stable
## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

### SNAPSHOTTING
RUN echo 'deb http://snapshot.debian.org/archive/debian/20131030/ jessie  main' > /etc/apt/sources.list \
    &&  apt-get -o Acquire::Check-Valid-Until=false update

RUN apt-get install -y --no-install-recommends \
    ed \
    less \
    littler\
    locales \
    r-base-dev \
    vim-tiny \
    wget \ 
 && ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r \
 && ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
 && ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
 && ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
 && install.r docopt \
 && rm -rf /tmp/downloaded_packages/

## Set the corresponding MRAN snapshot Repo (2014-09-08is the oldest available snapshot)
RUN echo 'options(repos = list(CRAN = "http://mran.revolutionanalytics.com/snapshot/2014-09-08/"))' >> /etc/R/Rprofile.site

## Set a default user. Available via runtime flag `--user docker` 
RUN useradd -g staff -m docker

## Configure default locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 && locale-gen en_US.utf8 \
 && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

