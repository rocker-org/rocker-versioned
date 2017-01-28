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
  # libpng12-dev \
  # libjpeg-dev \
  # libgif-dev \
  # libtiff-dev \
  # libgeotiff-dev \
  libproj-dev \
  libgeos-dev \
  libhdf4-alt-dev \
  libhdf5-dev \
  libsqlite3-dev \
  libfreexl-dev \
  unixodbc-dev \
  libexpat1-dev \
  libxerces-c-dev \
  libnetcdf-dev \
  libudunits2-dev \ 
  libkml-dev \
## Configure options based on homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
  && cd gdal* \
  && ./configure \
    --with-geotiff \
    --with-sqlite3 \
    --with-freexl \
    --with-spatialite \
    --with-geos \
    --with-hdf4 \
    --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serial \
    --with-libjson-c \
    --with-netcdf \
    --with-odbc \
    --with-curl \
    --without-grass \
    --without-libgrass \
  && make \
  && make install \
  && cd .. && rm -rf gdal-* \
  && . /etc/environment \
## Install R packages labeled "core" in Spatial taskview 
  && install2.r --error --repos $MRAN \
    classInt \
    DCluster \
    deldir \
    dggridR \
#       geoR \ ## Needs R built with tcl/tk support 
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
    