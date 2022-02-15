[![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)
[![Project Status: Moved to https://github.com/rocker-org/rocker-versioned2 – The project has been moved to a new location, and the version at that location should be considered authoritative.](https://www.repostatus.org/badges/latest/moved.svg)](https://github.com/rocker-org/rocker-versioned2)
[![DOI](https://zenodo.org/badge/25048007.svg)](https://zenodo.org/badge/latestdoi/25048007)


Visit [rocker-project.org](https://rocker-project.org) for more about available Rocker images, configuration, and use. 

# MOVED to [`rocker-versioned2`](https://github.com/rocker-org/rocker-versioned2)

This repository contains archived build scripts from the 3.x versioned series only.  Visit  [`rocker-versioned2`](https://github.com/rocker-org/rocker-versioned2) for current build scripts for 4.x versioned images.


## Version-stable Rocker images for R 3.x

![rocker](https://avatars0.githubusercontent.com/u/9100160?v=3&s=200)

***For documentation for R >= 4.0.0, for images `r-ver`, `rstudio`, `tidyverse`, `verse`, `geospatial`, `shiny`, and `binder`, please see the [`rocker-versioned2` repository](https://github.com/rocker-org/rocker-versioned2).*** 


image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[r-ver](https://hub.docker.com/r/rocker/r-ver)            |  Version-stable base R & src build tools  | [![](https://images.microbadger.com/badges/image/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver) | [![](https://img.shields.io/docker/pulls/rocker/r-ver.svg)](https://hub.docker.com/r/rocker/r-ver) |  [![](https://img.shields.io/docker/automated/rocker/r-ver.svg)](https://hub.docker.com/r/rocker/r-ver/builds)
[rstudio](https://hub.docker.com/r/rocker/rstudio)          |  Adds rstudio                             | [![](https://images.microbadger.com/badges/image/rocker/rstudio-stable.svg)](https://microbadger.com/images/rocker/rstudio) | [![](https://img.shields.io/docker/pulls/rocker/rstudio.svg)](https://hub.docker.com/r/rocker/rstudio)  |  [![](https://img.shields.io/docker/automated/rocker/rstudio.svg)](https://hub.docker.com/r/rocker/rstudio/builds)
[tidyverse](https://hub.docker.com/r/rocker/tidyverse)        |  Adds tidyverse & devtools                | [![](https://images.microbadger.com/badges/image/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse) | [![](https://img.shields.io/docker/pulls/rocker/tidyverse.svg)](https://hub.docker.com/r/rocker/tidyverse) |  [![](https://img.shields.io/docker/automated/rocker/tidyverse.svg)](https://hub.docker.com/r/rocker/tidyverse/builds) 
[verse](https://hub.docker.com/r/rocker/verse)            |  Adds tex & publishing-related packages   | [![](https://images.microbadger.com/badges/image/rocker/verse.svg)](https://microbadger.com/images/rocker/verse) | [![](https://img.shields.io/docker/pulls/rocker/verse.svg)](https://hub.docker.com/r/rocker/verse) | [![](https://img.shields.io/docker/automated/rocker/verse.svg)](https://hub.docker.com/r/rocker/verse/builds)


[rocker/geospatial](https://github.com/rocker-org/geospatial), 
[rocker/binder](https://github.com/rocker-org/binder) and
[rocker/shiny](https://github.com/rocker-org/shiny) are also build on this
stack, following the same versioning rules as described here.  

This repository provides alternate stack to `r-base`, with an emphasis on reproducibility.  Compared to those images, this stack:

- builds on debian stable (`debian:jessie` for versions < 3.4.0, `debian:stretch` after, etc) release instead of `debian:testing`, so no more apt-get breaking when `debian:testing` repos are updated and you had to muck with `-t unstable` to get apt-get to work.  
- Further, this stack installs a fixed version of R itself from source, rather than whatever is already packaged for Debian (the r-base stack gets the latest R version as a binary from debian:unstable), 
- and it installs all R packages from a fixed snapshot of CRAN at a given date (MRAN repos).
- provides images that are generally smaller than the r-base series

Users should include the version tag, e.g. `rocker/verse:3.3.1` when reproduciblity is paramount, and use the default `latest` tag, e.g. `rocker/verse` for the most up-to-date R packages.  All images still receive any Debian security patch updates.  Note that any debian packages on these images (C libraries, compilers, etc) will likely be older/earlier versions than those found on the `r-base` image series.

### NOTES

- **do not use `apt-get install r-cran-*` to install R packages on this stack**. The requested R version and all R packages are installed from source in the version-stable stack.  Installing R packages from `apt` (e.g. the `r-cran-*` packages) will install the version of R and versions of the packages that were built for the stable debian release (e.g. `debian:stretch`), giving you a second version of R and different packages.  Please install R packages from source using the `install.packages()` R function (or the `install2.r` script), and use `apt` only to install necessary system libraries (e.g. `libxml2`). If you would prefer to install only the latest verions of packages from pre-built binaries using `apt-get`, consider using the `r-base` stack instead.  

### Version Tags

Using the R version tag will naturally lock the R version, and also lock the install date of any R packages on the image.  For example,  `rocker/tidyverse:3.3.1` Docker image will always rebuild with R 3.3.1 and R packages installed from the **2016-10-31** MRAN snapshot, corresponding to **the last day that version of R was the most recent release**.  Meanwhile `rocker/tidyverse:latest` will always have both the latest R version and latest versions of the R packages, built nightly.   

See [VERSIONS.md](https://github.com/rocker-org/rocker-versioned/tree/master/VERSIONS.md) for details

### Images

The image `rocker/r-ver` is the functional equivalent of `r-base`, though slightly pared down.  Currently `r-ver` has tags for all minor R versions back to `3.1.0` (as far back as MRAN snapshots of CRAN are avialable); see [all tags](https://hub.docker.com/r/rocker/r-ver/tags). Users can attempt to build other versions from the `r-ver` Dockerfile by specifying `--build-arg R_VERSION=<VERSION>`, though this is unlikely to work with very old R versions.  Likewise, all non-current images are automatically pinned to a MRAN snapshot of CRAN from the last day that version was current.  Users can set a custom snapshot date for the `r-ver` images by using `--build-arg BUILD_DATE=<DATE>` when building that Dockerfile. 

The `rocker/rstudio` image builds with the latest version of RStudio by default. This can be customized by specifying the desired version in `--build-arg RSTUDIO_VERSION=<VERSION>` if building locally from its Dockerfile.


## RStudio and Runtime Options

See the [RStudio README](https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/README.md) for documentation on setting passwords, sharing volumes, adding RStudio Shiny Server(TM), and other configuration.


## Maintenance and Updates

These images are actively maintained.  This means that while an effort is made to preserve the general function of these images over time, both these Dockerfiles and the resulting images are subject to some change over time.  In particular:

- Images are regularly re-built on Docker Hub whenever their base image changes, starting with changes to `debian` Docker image.  This is the rough equivalent of running `apt-get upgrade` on `debian`, since all `apt-get` commands are re-run and will pull in the most current sources.  This allows the images to receive security updates to any packages installed from the `debian` repositories, but will not in general change the versions of any software and is very unlikely to break anything.

- The Dockerfiles themselves are subject to change, to improve performance, ease of use, readability, or other concerns raised in the issues.  These changes should also not alter the general behavior of R or R packages on the image.  These changes can be seen in the git history.  The [rocker-versioned](https://github.com/rocker-org/rocker-versioned) repo will use its own semantic version tagging to indicate changes to this repository, with snapshots from these tags archived on Zenodo.


## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use of the trademarked term RStudio and the distribution of the RStudio binaries through the images hosted on [hub.docker.com](https://registry.hub.docker.com/) has been granted by explicit permission of RStudio.  Please review [RStudio's trademark use policy](http://www.rstudio.com/about/trademark/) and address inquiries about further distribution or other questions to [permissions@rstudio.com](mailto:permissions@rstudio.com).


