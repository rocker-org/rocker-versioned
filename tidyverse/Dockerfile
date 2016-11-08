FROM rocker/rstudio:3.3.2

ARG BUILD_DATE
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  build-essential \
  libxml2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  ## R dependencies, snapshot to build date
  && [ -z "$BUILD_DATE" ] && BUILD_DATE=$(date -I) || true \
  && MRAN=https://mran.microsoft.com/snapshot/$BUILD_DATE \
  && Rscript -e "install.packages(c('RSQLite', 'RMySQL', 'RPostgreSQL'), repo = '$MRAN')" \
  ## Temporary measure while git2r config is broken
  && Rscript -e "install.packages('devtools', repo = '$MRAN'); devtools::install_github('ropensci/git2r')" \
  ## Install tidyverse & devtools full suite
  && Rscript -e "install.packages(c('tidyverse', 'devtools'), dep=TRUE, repo = '$MRAN')"

