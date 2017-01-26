FROM rocker/tidyverse:latest
MAINTAINER "Carl Boettiger" cboettig@ropensci.org

ENV GDAL_VERSION 2.1.2
ENV MRAN https://cloud.r-project.org/

## Add LaTeX, rticles and bookdown support
RUN echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list \
  && apt-get update \
#  && apt-get build-dep -o APT::Get::Build-Dep-Automatic=true libgdal-dev \
  && apt-get install -y --no-install-recommends \
  ## Dependencies as used in homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
  libpng12-dev \
  libjpeg-dev \
  libgif-dev \
  libtiff-dev \
  libgeotiff-dev \
  libproj-dev \
  libgeos-dev \
  libsqlite3-dev \
  libfreexl.dev \
  libspatialite-dev \
  unixodbc-dev \
  ## Optionsl? Maybe leave out in the base image?
  netcdf-bin \
  libudunits2-dev

RUN wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \
  && tar -xf gdal-${GDAL_VERSION}.tar.gz
  
  ## Configure options take from homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
RUN cd gdal* \
  && ./configure \
    --with-jpeg \
    --without-jpeg12 \
    --with-gif \
    --with-libtiff \
    --with-geotiff \
    --with-sqlite3 \
    --with-freexl \
    --with-spatialite \
    --with-geos \
    --with-static-proj4 \
    --with-libjson-c \
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


