FROM rocker/rstudio:3.3.2

ARG BUILD_DATE
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  ## Set default repo to install all packages from date-locked MRAN snapshot of CRAN
  && [ -z "$BUILD_DATE" ] && BUILD_DATE=$(date -I --date='TZ="America/Los_Angeles"') || true \
  && MRAN=https://mran.microsoft.com/snapshot/$BUILD_DATE \
  && echo "options(repos = c(CRAN = 'https://cran.rstudio.com', MRAN = '$MRAN'))" > /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "install.packages(c('RSQLite', 'RMySQL', 'RPostgreSQL'), repo = getOption('repos')[['MRAN']])" \
  ## Temporary measure while git2r config is broken
  && Rscript -e "install.packages('devtools'); devtools::install_github('ropensci/git2r')" \
  ## Install tidyverse & devtools suites (including suggests)
  && Rscript -e "install.packages(c('tidyverse', 'devtools', 'profvis'), dep=TRUE, repo = getOption('repos')[['MRAN']])"

