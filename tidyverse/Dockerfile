FROM rocker/rstudio:3.3.2

ARG BUILD_DATE
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  ## install these packages from date-locked MRAN snapshot of CRAN
  && [ -z "$BUILD_DATE" ] && BUILD_DATE=$(date -I --date='TZ="America/Los_Angeles"') || true \
  ## use an install script so installation failures are errors, not warnings.
  ## In this script, REPOS and DEPS arguments are set via env vars, package names given as arguments
  && wget https://raw.githubusercontent.com/rocker-org/rocker-versioned/master/tidyverse/install.r -O /usr/local/bin/install.r \
  && chmod +x /usr/local/bin/install.r \
  ## grab a devtools dependency which is not on CRAN:
  && export REPOS=http://www.bioconductor.org/packages/release/bioc \
  && install.r BiocInstaller \
  ## Keep track of the MRAN version, so downstream Dockerfiles can build from this snapshot too
  && echo "REPOS=https://mran.microsoft.com/snapshot/$BUILD_DATE" >> /usr/local/lib/R/etc/Renviron \
  && export INCLUDE_SUGGESTS="TRUE" \
  && install.r tidyverse devtools profvis

