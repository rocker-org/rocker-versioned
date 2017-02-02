FROM rocker/tidyverse:latest
MAINTAINER "Carl Boettiger" cboettig@ropensci.org

ENV GDAL_VERSION 2.1.3
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \
  && tar -xf gdal-${GDAL_VERSION}.tar.gz \
## Install dependencies of gdal-$GDAL_VERSION
## && echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list \
  && apt-get update \
##  && apt-get build-dep -y -o APT::Get::Build-Dep-Automatic=true libgdal-dev \
  && apt-get install -y --no-install-recommends \
  ## dev packages
  libexpat1-dev \
  libfreexl-dev \
  libgeos-dev \
  libgsl0-dev \
  libglu1-mesa-dev \
  libhdf4-alt-dev \
  libhdf5-dev \
  libkml-dev \
  libnetcdf-dev \
  libproj-dev \
  libsqlite3-dev \
  libssl-dev \
  libudunits2-dev \ 
  libxerces-c-dev \
  unixodbc-dev \
  ## runtime packages
  netcdf-bin \
## Configure options based on homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
  && cd gdal* \
  && ./configure \
    --with-curl \
    --with-freexl \
    --with-geos \
    --with-geotiff \
    --with-hdf4 \
    --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serial \
    --with-libjson-c \
    --with-netcdf \
    --with-odbc \
    --with-spatialite \
    --with-sqlite3 \
    --without-grass \
    --without-libgrass \
  && make \
  && make install \
  && cd .. && rm -rf gdal-* \
  && . /etc/environment \
  ## Install R packages labeled "core" in Spatial taskview 
  && install2.r --error \
    --repos 'https://cloud.r-project.org/' \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --deps TRUE \
    ## from CRAN
    DCluster \
    RColorBrewer \
    ## RandomFields \ ## depends on tcl/tk (direct or indirect)
    classInt \
    deldir \
    dggridR \
    gstat \
    lidR \
    maptools \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    ## sf \
    sp \
    spacetime \
    ## spatstat \ ## Needs tcltk
    spdep \
    splancs \
    ##  geoR \ ## Needs R built with tcl/tk support
    ## from bioconductor
    rhdf5 
