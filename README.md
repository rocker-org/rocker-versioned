[![CircleCI](https://circleci.com/gh/rocker-org/rocker-versioned.svg?style=svg)](https://circleci.com/gh/rocker-org/rocker-versioned) [![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)


## Version-stable Rocker images

![rocker](https://avatars0.githubusercontent.com/u/9100160?v=3&s=200)


image            | description                               | tags 
---------------- | ----------------------------------------  | ---- 
r-ver:3.3.2      |  Version-stable base R & src build tools  | [![](https://images.microbadger.com/badges/image/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/3.3.2/Dockerfile)  
rstudio:3.3.2    |  Adds rstudio                             | [![](https://images.microbadger.com/badges/image/cboettig/rstudio.svg)](https://microbadger.com/) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker/blob/master/rstudio/3.3.2/Dockerfile)  
tidyverse:3.3.2  |  Adds tidyverse & devtools                | [![](https://images.microbadger.com/badges/image/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/3.3.2/Dockerfile)  
verse:3.3.2      |  Adds tex & publishing-related packages   | [![](https://images.microbadger.com/badges/image/rocker/verse.svg)](https://microbadger.com/images/rocker/verse) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/verse/3.3.2/Dockerfile)  


Notes
-----

- To use the versioned images, you must include the R version as the tag in the image name.
- All `rocker-versioned` images build on `debian:jessie`, the current stable release of Debian. (`r-base` and all `:latest`-tagged rocker images build from `debian:testing` and `debian:unstable` repos, which provide more recent versions of libraries and compilers, but the regular updates to these can break dependent packages).
- `rstudio` image builds with rstudio v 1.0.44 by default. This can be customized by specifying the desired version in `--build-arg RSTUIO_VERSION=<VERSION>` at build time.
- `tidyverse` the image sets the default CRAN package repository to the MRAN snapshot of CRAN on the date the image is built.  Consequently all R packages installed on this and subsequen images without specifying an alternate repository will correspond to this same snapshot date. This can be customized with the `--build-dep BUILD_DATE=<DATE>` argument when building the `tidyverse` image locally. This ensures the version of any R package remains the same when this or subsequent docker images are rebuilt from their Dockerfiles.


