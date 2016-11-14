FROM rocker/rstudio:3.3.2

ARG BUILD_DATE
ENV BUILD_DATE ${BUILD_DATE:-2016-11-08}
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
  ## Install tidyverse & devtools suites (including suggests)
  && Rscript -e "install.packages(c('tidyverse', 'devtools', 'profvis'), dep=TRUE, repo = getOption('repos')[['MRAN']])"

