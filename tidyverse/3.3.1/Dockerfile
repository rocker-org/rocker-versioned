FROM rocker/rstudio:3.3.1

ARG BUILD_DATE
ENV BUILD_DATE ${BUILD_DATE:-2016-10-31}
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  ## Databases
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  ## install these packages from date-locked MRAN snapshot of CRAN
  && [ -z "$BUILD_DATE" ] && BUILD_DATE=$(date -I --date='TZ="America/Los_Angeles"') || true \
  && MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos=c(CRAN='$MRAN'))" > /usr/local/lib/R/Rprofile.site \ 
  && Rscript -e "install.packages(c('littler', 'docopt'), repo = '$MRAN')" \
  && ln -s /usr/local/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
  && ln -s /usr/local/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
  && ln -s /usr/local/lib/R/site-library/littler/bin/r /usr/local/bin/r \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \ 
    --deps "TRUE" \
    tidyverse devtools profvis

