#!/bin/bash

R_VERSION=3.3.3
R_HOME=/usr/local/lib/R

mkdir tmp
cd tmp

#apt-get update && apt-get -y install curl \
#curl -k -O https://cran.r-project.org/src/base/R-3/R-${R_VERSION}.tar.gz
wget --no-check-certificate https://cran.r-project.org/src/base/R-3/R-${R_VERSION}.tar.gz
tar -xf R-${R_VERSION}.tar.gz \
&& cp -r R-${R_VERSION}/tests ${R_HOME}/tests 

echo \
 'Sys.setenv(LC_COLLATE = "C", LC_TIME = "C", LANGUAGE = "en")
  library("tools")
  testInstalledBasic("both")
  testInstalledPackages(scope = "base")' > test.R

R --vanilla -e 'source("test.R")'

rm -rf tmp ${R_HOME}/tests
