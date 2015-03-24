## Emacs, make this -*- mode: sh; -*-

## start with the Docker 'base R' Debian-based image
FROM rocker/r-devel

## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

## Check out R-devel
RUN rm -rf /tmp && mkdir /tmp && cd /tmp \
&& svn co http://svn.r-project.org/R/tags/R-2-14-0/ R-devel 

## Build and install according the standard 'recipe' I emailed/posted years ago
RUN cd /tmp/R-devel \
&& R_PAPERSIZE=letter \
   R_BATCHSAVE="--no-save --no-restore" \
   R_BROWSER=xdg-open \
   PAGER=/usr/bin/pager \
   PERL=/usr/bin/perl \
   R_UNZIPCMD=/usr/bin/unzip \
   R_ZIPCMD=/usr/bin/zip \
   R_PRINTCMD=/usr/bin/lpr \
   LIBnn=lib \
   AWK=/usr/bin/awk \
   CFLAGS="-pipe -std=gnu99 -Wall -pedantic -O3" \
   CXXFLAGS="-pipe -Wall -pedantic -O3" \
   ./configure --enable-R-shlib \
               --without-blas \
               --without-lapack \
               --without-readline \
               --without-recommended-packages \
               --program-suffix=dev \
&& make \
&& make install \
&& rm -rf /tmp/r-devel

## Set Renviron.site to get libs from base R install
RUN echo "R_LIBS_SITE=\${R_LIBS_SITE-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" > /usr/local/lib/R/etc/Renviron.site

RUN cd /usr/local/bin \
&& mv R Rdevel \
&& mv Rscript Rscriptdevel

