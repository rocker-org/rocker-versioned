FROM rocker/tidyverse:3.3.2
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
  libdap-dev \
  libexpat1-dev \
  libfftw3-dev \
  libfreexl-dev \
  libgeos-dev \
  libgsl0-dev \
  libglu1-mesa-dev \
  libhdf4-alt-dev \
  libhdf5-dev \
  libwgeom-dev \
  libkml-dev \
  libnetcdf-dev \
  libproj-dev \
  libsqlite3-dev \
  libssl-dev \
  libtcl8.5 \
  libtk8.5 \
  libtiff5-dev \
  libudunits2-dev \ 
  libxerces-c-dev \
 ## runtime packages
  netcdf-bin \
  unixodbc-dev \
## Configure options loosely based on homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
  && cd gdal* \
  && ./configure \
    --with-curl \
    --with-dods-root=/usr \
    --with-freexl \
    --with-geos \
    --with-geotiff \
    --with-hdf4 \
    --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serial \
    --with-libjson-c \
    --with-netcdf \
    --with-odbc \
    ##
    --without-grass \
    --without-libgrass \
  && make \
  && make install \
  && cd .. \
  ## Cleanup gdal installation
  && rm -rf gdal-* \
  && . /etc/environment \
## Install R packages labeled "core" in Spatial taskview 
  && install2.r --error \
    --repos 'https://cloud.r-project.org/' \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    ## from CRAN
    DCluster \
    RColorBrewer \
    RandomFields \
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
    sf \
    sp \
    spacetime \
    spatstat \
    spdep \
    splancs \
    geoR \
    ## from bioconductor
    rhdf5 
