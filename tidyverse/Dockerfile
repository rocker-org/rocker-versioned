FROM rocker/rstudio:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \ 
    --deps "TRUE" \
    ## explicitly include dplyr & ggplot2 to get their suggests lists
    tidyverse devtools profvis dplyr ggplot2

