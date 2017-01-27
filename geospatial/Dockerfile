FROM rocker/tidyverse:latest
MAINTAINER "Carl Boettiger" cboettig@ropensci.org


ENV GDAL_VERSION 2.1.3
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

ENV MRAN https://cloud.r-project.org/

RUN wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \
  && tar -xf gdal-${GDAL_VERSION}.tar.gz

## Install dependencies of gdal-$GDAL_VERSION
RUN echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list \
  && apt-get update \
#  && apt-get build-dep -o APT::Get::Build-Dep-Automatic=true libgdal-dev \
  && apt-get install -y --no-install-recommends \
  # libpng12-dev \
  # libjpeg-dev \
  # libgif-dev \
  # libtiff-dev \
  # libgeotiff-dev \
  libproj-dev \
  libgeos-dev \
  ## hdf4
  libhdf4-alt-dev \
  ## hdf5
  libhdf5-dev \
  ## sqlite
  libsqlite3-dev \
  ## freexl
  libfreexl.dev \
  ## odbc
  unixodbc-dev \
  ## diverse
  libexpat1-dev \
  libxerces-c-dev \
  libnetcdf-dev \
  libudunits2-dev \
  ## KML 
  libkml-dev 

  
## Configure options based on homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
RUN cd gdal* \
  && ./configure \
    --with-geotiff \
    --with-sqlite3 \
    --with-freexl \
    --with-spatialite \
    --with-geos \
    --with-hdf4 \
    --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serialSV \
    --with-libjson-c \
    --with-netcdf \
    --with-odbc \
    --with-curl \
    --without-grass \
    --without-libgrass \
  && make \
  && make install \
  && cd .. && rm -rf gdal-* \
  && . /etc/environment

## Install R packages labeled "core" in Spatial taskview 
RUN install2.r --error --repos $MRAN \
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


