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
  && wget https://raw.githubusercontent.com/rocker-org/rocker-versioned/master/tidyverse/install.r -O /usr/local/bin/install.r \
  && chmod +x /usr/local/bin/install.r \
## devtools dependency not on CRAN:
  && export REPOS=http://www.bioconductor.org/packages/release/bioc \
  && install.r BiocInstaller \
  && export REPOS=https://mran.microsoft.com/snapshot/$BUILD_DATE \
  && install.r RSQLite RMySQL RPostgreSQL \
  && export INCLUDE_SUGGESTS="TRUE" \
  && install.r tidyverse devtools profvis
ENV REPOS $REPOS
