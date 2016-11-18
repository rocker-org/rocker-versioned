[![CircleCI](https://circleci.com/gh/rocker-org/rocker-versioned.svg?style=svg)](https://circleci.com/gh/rocker-org/rocker-versioned) [![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)


## Version-stable Rocker images

![rocker](https://avatars0.githubusercontent.com/u/9100160?v=3&s=200)


image            | description                               | badges 
---------------- | ----------------------------------------  | ------ 
[r-ver](https://hub.docker.com/r/rocker/r-ver)            |  Version-stable base R & src build tools  | [![](https://images.microbadger.com/badges/image/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/3.3.2/Dockerfile)  [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/Dockerfile)
[rstudio](https://hub.docker.com/r/rocker/rstudio)          |  Adds rstudio                             | [![](https://images.microbadger.com/badges/image/rocker/rstudio-stable.svg)](https://microbadger.com/) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker/blob/master/rstudio/3.3.2/Dockerfile)  [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/Dockerfile)  
[tidyverse](https://hub.docker.com/r/rocker/tidyverse)        |  Adds tidyverse & devtools                | [![](https://images.microbadger.com/badges/image/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/3.3.2/Dockerfile) [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/Dockerfile)  
[verse](https://hub.docker.com/r/rocker/verse)            |  Adds tex & publishing-related packages   | [![](https://images.microbadger.com/badges/image/rocker/verse.svg)](https://microbadger.com/images/rocker/verse) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/verse/3.3.2/Dockerfile)  [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/verse/Dockerfile)


This repository provides alternate stack to `r-base`, `rocker/rstudio`, `rocker/hadleyverse` series, with an emphasis on reproducibility.  Compared to those images, this stack:

- builds on the stable `debian:jessie` release instead of `debian:testing`, so no more apt-get breaking when debian:testing repos are updated and you had to muck with `-t unstable` to get apt-get to work.  
- Further, this stack installs a fixed version of R itself from source, rather than whatever is already packaged for Debian (the r-base stack gets the latest R version as a binary from debian:unstable), 
- and it installs all R packages from a fixed snapshot of CRAN at a given date (MRAN repos).
- provides images that are generally smaller than the r-base series

Users should include the version tag, e.g. `rocker/verse:3.3.2` when reproduciblity is paramount, and use the default `latest` tag, e.g. `rocker/verse` for the most up-to-date R packages.  All images still receive any Debian security patch updates.  Note that any debian packages on these images (C libraries, compilers, etc) will likely be older/earlier versions than those found on the `r-base` image series.

### Version Tags

Using the R version tag will naturally lock the R version, and also lock the install date of any R packages on the image.  For example,  `rocker/tidyverse:3.3.2` Docker image will always rebuild with R 3.3.2 and R packages installed from the **2016-11-08** snapshot of CRAN, while `rocker/tidyverse:latest` will always have both the latest R version and latest versions of the R packages.  Note that packages installed by a user (e.g. with `install.packages()` either interactively or via downstream Dockerfiles) will still install the latest versions from the RStudio CRAN mirror by default.  To install additional packages from the same CRAN snapshot as used on the `tidyverse` image (e.g. to decrease the chance of package incompatibilities), users must explicitly specify that MRAN repo, which is stored for reference in `/etc/environment`. See the [rocker/verse](https://github.com/rocker-org/rocker-versioned/blob/master/verse/Dockerfile) Dockerfile for an example of this.  New tags will be added with new R releases, with snapshot date being fixed when those Dockerfiles are created.

### Images

The image `rocker/r-ver` is the functional equivalent of `r-base`, though slightly pared down.  Currently `r-ver` has tags for all minor R versions back to `2.15.0`; see [all tags](https://hub.docker.com/r/rocker/r-ver/tags). Users can attempt to build other versions from the `r-ver` Dockerfile by specifying `--build-arg R_VERSION=<VERSION>`, though this is unlikely to work with very old R versions.

The image `rocker/tidyverse` is the functional equivalent of `rocker/hadleyverse`, minus the LaTeX part which is moved into a downstream `rocker/verse` in order to keep the `tidyverse` image more compact.  Now that [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html) is a thing, the term "hadleyverse" is on the way out.  Users building the `tidyverse` Dockerfile directly can set a custom snapshot date for the image by using `--build-arg BUILD_DATE=<DATE>`. 

The `rocker/rstudio` image builds with RStudio `v1.0.44` by default. This can be customized by specifying the desired version in `--build-arg RSTUDIO_VERSION=<VERSION>` if building locally from its Dockerfile. *Note that:* `rocker/rstudio:latest` is the only image name in this stack that already existed.  For consistency, `rocker/rstudio:latest` now builds on `r-ver:latest` instead of `r-base:latest`.  This change may break downstream images, which should either build explicitly on the `debian:testing` stack by using the `testing` tag (`rocker/rstudio:testing`) or be patched to support this change.


