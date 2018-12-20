# R, MRAN, RStudio Server versions correspondance

In order to get coherent versioned Rocker containers, versions of R, R packages,
and RStudio Server are match on a time scale by default. Change MRAN date for
`rocker/r-ver` using e.g. (from the corresponding dir):

```
docker build --build-arg BUILD_DATE=2017-10-31 -t rocker/r-ver:3.4.2 .
```

Change RStudio Server version for `rocker/rstudio` using, e.g. (from the
corresponding dir):

```
docker build --build-arg RSTUDIO_VERSION=1.1.414 -t rocker/rstudio:3.4.2 .
```


## Rules

- The default docker tag, `latest`, is now identical to the image tagged with
  the current version.  (Previously, the former used the 
  <https://cran.rstudio.com> mirror while the latter used MRAN snapshot
  matching the build date.  Now this image is built nightly using MRAN snapshot
  for that day.)

- MRAN date is the last date CRAN distributed that R version.

- RStudio Server version (and date) from http://download2.rstudio.org/ as the
  version that was available at MRAN date, with the only exception of R 3.3.1
  where RStudio Server v. 1.0.44 with tons of improvements over v. 0.9.903 was
  released just one day after the MRAN date.

- Docker tags specifying only the minor (`3.4`) or major version (`3`) are also
  available. Requesting a minor version `3.4` will automatically correspond to
  the highest available patch number (`3.4.4`).   

|R version | MRAN date  | RStudio version | RStudio date |
|----------|------------|-----------------|--------------|
| 3.1.0    | 2014-09-17 | NA              | NA           |
| 3.2.0    | 2015-06-18 | NA              | NA           |
| 3.2.5    | 2016-05-03 | NA              | NA           |
| 3.3.0    | 2016-06-21 | NA              | NA           |
| 3.3.1    | 2016-10-31 | 1.0.44          | 2016-11-01   |
| 3.3.2    | 2017-03-06 | 1.0.136         | 2016-12-21   |
| 3.3.3    | 2017-04-21 | 1.0.143         | 2017-04-19   |
| 3.4.0    | 2017-06-30 | 1.0.143         | 2017-04-19   |
| 3.4.1    | 2017-09-28 | 1.0.153         | 2017-07-20   |
| 3.4.2    | 2017-11-30 | 1.1.383         | 2017-10-09   |
| 3.4.3    | 2017-03-15 | 1.1.442         | 2018-03-12   |
| 3.4.4    | 2018-04-23 | 1.1.447         | 2018-04-18   |
| 3.5.0    | 2018-07-02 | 1.1.447         | 2018-04-18   |
| 3.5.1    | 2018-12-20 | 1.1.463         | 2018-10-29   |
| 3.5.2    | latest     | latest          | latest       |


