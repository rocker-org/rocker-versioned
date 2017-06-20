[![CircleCI](https://circleci.com/gh/rocker-org/rocker-versioned.svg?style=svg)](https://circleci.com/gh/rocker-org/rocker-versioned)
[![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![DOI](https://zenodo.org/badge/25048007.svg)](https://zenodo.org/badge/latestdoi/25048007)



## Version-stable Rocker images

![rocker](https://avatars0.githubusercontent.com/u/9100160?v=3&s=200)


image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[r-ver](https://hub.docker.com/r/rocker/r-ver)            |  Version-stable base R & src build tools  | [![](https://images.microbadger.com/badges/image/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver) | [![](https://img.shields.io/docker/pulls/rocker/r-ver.svg)](https://hub.docker.com/r/rocker/r-ver) |  [![](https://img.shields.io/docker/automated/rocker/r-ver.svg)](https://hub.docker.com/r/rocker/r-ver/builds)
[rstudio](https://hub.docker.com/r/rocker/rstudio)          |  Adds rstudio                             | [![](https://images.microbadger.com/badges/image/rocker/rstudio-stable.svg)](https://microbadger.com/) | [![](https://img.shields.io/docker/pulls/rocker/rstudio.svg)](https://hub.docker.com/r/rocker/rstudio)  |  [![](https://img.shields.io/docker/automated/rocker/rstudio.svg)](https://hub.docker.com/r/rocker/rstudio/builds)
[tidyverse](https://hub.docker.com/r/rocker/tidyverse)        |  Adds tidyverse & devtools                | [![](https://images.microbadger.com/badges/image/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse) | [![](https://img.shields.io/docker/pulls/rocker/tidyverse.svg)](https://hub.docker.com/r/rocker/tidyverse) |  [![](https://img.shields.io/docker/automated/rocker/tidyverse.svg)](https://hub.docker.com/r/rocker/tidyverse/builds) 
[verse](https://hub.docker.com/r/rocker/verse)            |  Adds tex & publishing-related packages   | [![](https://images.microbadger.com/badges/image/rocker/verse.svg)](https://microbadger.com/images/rocker/verse) | [![](https://img.shields.io/docker/pulls/rocker/verse.svg)](https://hub.docker.com/r/rocker/verse) | [![](https://img.shields.io/docker/automated/rocker/verse.svg)](https://hub.docker.com/r/rocker/verse/builds)


This repository provides alternate stack to `r-base`, `rocker/rstudio`, `rocker/hadleyverse` series, with an emphasis on reproducibility.  Compared to those images, this stack:

- builds on debian stable (`debian:jessie` for versions < 3.4.0, `debian:stretch` thereafter) release instead of `debian:testing`, so no more apt-get breaking when `debian:testing` repos are updated and you had to muck with `-t unstable` to get apt-get to work.  
- Further, this stack installs a fixed version of R itself from source, rather than whatever is already packaged for Debian (the r-base stack gets the latest R version as a binary from debian:unstable), 
- and it installs all R packages from a fixed snapshot of CRAN at a given date (MRAN repos).
- provides images that are generally smaller than the r-base series

Users should include the version tag, e.g. `rocker/verse:3.3.1` when reproduciblity is paramount, and use the default `latest` tag, e.g. `rocker/verse` for the most up-to-date R packages.  All images still receive any Debian security patch updates.  Note that any debian packages on these images (C libraries, compilers, etc) will likely be older/earlier versions than those found on the `r-base` image series.

### Version Tags

Using the R version tag will naturally lock the R version, and also lock the install date of any R packages on the image.  For example,  `rocker/tidyverse:3.3.1` Docker image will always rebuild with R 3.3.1 and R packages installed from the **2016-10-31** MRAN snapshot, corresponding to **the last day that version of R was the most recent release**.   Meanwhile `rocker/tidyverse:latest` will always have both the latest R version and latest versions of the R packages.  


### Images

The image `rocker/r-ver` is the functional equivalent of `r-base`, though slightly pared down.  Currently `r-ver` has tags for all minor R versions back to `3.1.0` (as far back as MRAN snapshots of CRAN are avialable); see [all tags](https://hub.docker.com/r/rocker/r-ver/tags). Users can attempt to build other versions from the `r-ver` Dockerfile by specifying `--build-arg R_VERSION=<VERSION>`, though this is unlikely to work with very old R versions.  Likewise, all non-current images are automatically pinned to a MRAN snapshot of CRAN from the last day that version was current.  Users can set a custom snapshot date for the `r-ver` images by using `--build-arg BUILD_DATE=<DATE>` when building that Dockerfile. 

The image `rocker/tidyverse` is the functional equivalent of `rocker/hadleyverse`, minus the LaTeX part which is moved into a downstream `rocker/verse` in order to keep the `tidyverse` image more compact.  Now that [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html) is a thing, the term "hadleyverse" is on the way out. 
 
The `rocker/rstudio` image builds with RStudio `v1.0.44` by default. This can be customized by specifying the desired version in `--build-arg RSTUDIO_VERSION=<VERSION>` if building locally from its Dockerfile. *Note that:* `rocker/rstudio:latest` is the only image name in this stack that already existed.  For consistency, `rocker/rstudio:latest` now builds on `r-ver:latest` instead of `r-base:latest`.  This change may break downstream images, which should either build explicitly on the `debian:testing` stack by using the `testing` tag (`rocker/rstudio:testing`) or be patched to support this change.




image            |  Dockerfiles  
---------------- | -------------
[r-ver](https://hub.docker.com/r/rocker/r-ver/tags)         | [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/Dockerfile) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/3.3.2/Dockerfile)  [![](https://img.shields.io/badge/Dockerfile-...-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/)  [![](https://img.shields.io/badge/Dockerfile-v3.1.0-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/3.1.0/Dockerfile) 
[rstudio](https://hub.docker.com/r/rocker/rstudio/tags)     |  [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/Dockerfile) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker/blob/master/rstudio/3.3.2/Dockerfile)  [![](https://img.shields.io/badge/Dockerfile-v3.3.1-blue.svg)](https://github.com/rocker-org/rocker/blob/master/rstudio/3.3.1/Dockerfile) 
[tidyverse](https://hub.docker.com/r/rocker/tidyverse/tags) | [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/Dockerfile) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/3.3.2/Dockerfile)   [![](https://img.shields.io/badge/Dockerfile-v3.3.1-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/3.3.1/Dockerfile) 
[verse](https://hub.docker.com/r/rocker/verse/tags)         |  [![](https://img.shields.io/badge/Dockerfile-latest-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/verse/Dockerfile) [![](https://img.shields.io/badge/Dockerfile-v3.3.2-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/verse/3.3.2/Dockerfile)  [![](https://img.shields.io/badge/Dockerfile-v3.3.1-blue.svg)](https://github.com/rocker-org/rocker-versioned/blob/master/verse/3.3.1/Dockerfile) 


## Maintenance and Updates

These images are actively maintained.  This means that while an effort is made to preserve the general function of these images over time, both these Dockerfiles and the resulting images are subject to some change over time.  In particular:

- Images are regularly re-built on Docker Hub whenever their base image changes, starting with changes to `debian` Docker image.  This is the rough equivalent of running `apt-get upgrade` on `debian`, since all `apt-get` commands are re-run and will pull in the most current sources.  This allows the images to receive security updates to any packages installed from the `debian` repositories, but will not in general change the versions of any software and is very unlikely to break anything.

- The Dockerfiles themselves are subject to change, to improve performance, ease of use, readability, or other concerns raised in the issues.  These changes should also not alter the general behavior of R or R packages on the image.  These changes can be seen in the git history.  The [rocker-versioned](https://github.com/rocker-org/rocker-versioned) repo will use its own semantic version tagging to indicate changes to this repository, with snapshots from these tags archived on Zenodo.


## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use of the trademarked term RStudio and the distribution of the RStudio binaries through the images hosted on [hub.docker.com](https://registry.hub.docker.com/) has been granted by explicit permission of RStudio.  Please review [RStudio's trademark use policy](http://www.rstudio.com/about/trademark/) and address inquiries about further distribution or other questions to [permissions@rstudio.com](emailto:permissions@rstudio.com).


