FROM rocker/tidyverse:latest
MAINTAINER "Carl Boettiger" cboettig@ropensci.org

ENV GDAL_VERSION 2.1.2
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH 

## Add LaTeX, rticles and bookdown support
RUN echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get build-dep -y -o APT::Get::Build-Dep-Automatic=true libgdal-dev \
  && apt-get install -y --no-install-recommends \
  libgeos-dev \
  libproj-dev \
  libudunits2-dev \
  && wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \
  && tar -xf gdal-${GDAL_VERSION}.tar.gz \
  && cd gdal* \
  && ./configure && make && make install \
  && cd .. && rm -rf gdal-* \
  && . /etc/environment \
  ## Install R packages labeled "core" in Spatial taskview 
  && install2.r --error --repos $MRAN \
    classInt \
    DCluster \
    deldir \
    dggridR \
#    geoR \ ## Needs R built with tcl/tk support 
    gstat \
    maptools \
    RandomFields \
    raster \
    RColorBrewer \
    rgdal \
    rgeos \
    sf \
    sp \
    spacetime \
    spatstat \
    spdep \
    splancs


