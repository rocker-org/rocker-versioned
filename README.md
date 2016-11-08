[![CircleCI](https://circleci.com/gh/rocker-org/rocker-versioned.svg?style=svg)](https://circleci.com/gh/rocker-org/rocker-versioned) 
[![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)


image      | description                               | tags 
---------- | ----------------------------------------  | ---- 
r-ver      |  Version-stable base R & src build tools  | [![](https://images.microbadger.com/badges/image/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver "Get your own image badge on microbadger.com")  [![](https://images.microbadger.com/badges/version/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver "Get your own version badge on microbadger.com") 
rstudio    |  Adds rstudio                             | [![](https://images.microbadger.com/badges/image/rocker/rstudio.svg)](https://microbadger.com/images/rocker/rstudio "Get your own image badge on microbadger.com")  [![](https://images.microbadger.com/badges/version/rocker/rstudio.svg)](https://microbadger.com/images/rocker/rstudio "Get your own version badge on microbadger.com")  
tidyverse  |  Adds tidyverse & devtools                | [![](https://images.microbadger.com/badges/image/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse "Get your own image badge on microbadger.com")  [![](https://images.microbadger.com/badges/version/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse "Get your own version badge on microbadger.com") 
verse      |  Adds tex & publishing-related packages   | [![](https://images.microbadger.com/badges/image/rocker/verse.svg)](https://microbadger.com/images/rocker/verse "Get your own image badge on microbadger.com")  [![](https://images.microbadger.com/badges/version/rocker/verse.svg)](https://microbadger.com/images/rocker/verse "Get your own version badge on microbadger.com") 


Notes
-----

- All `rocker-versioned` images build on `debian:jessie`, the current stable release of Debian. (`r-base` and all `latest` rocker images build from `debian:testing` and may provide more recent versions of libraries and compilers).
- `rstudio` image builds with rstudio v 1.0.44 by default. This can be customized by specifying the desired version in `--build-arg RSTUIO_VERSION=<VERSION>` at build time.
- `tidyverse` the image sets the default CRAN package repository to the MRAN snapshot of CRAN on the date the image is built.  Consequently all R packages installed on this and subsequen images without specifying an alternate repository will correspond to this same snapshot date. This can be customized with the `--build-dep BUILD_DATE=<DATE>` argument when building the `tidyverse` image locally. This ensures the version of any R package remains the same when this or subsequent docker images are rebuilt from their Dockerfiles.


