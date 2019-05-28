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

- Docker tags correspond to the version of R included on the image.

- The default docker tag, `latest`, is now identical to the image tagged with
  the current version.  `latest` and `devel` tags are built nightly.

- MRAN date is the last date CRAN distributed that R version.

- RStudio Server version (and date) from http://download2.rstudio.org/ as the
  version that was available at MRAN date.

<!-- (tags may not always be available)
- Docker tags specifying only the minor (`3.4`) or major version (`3`) are also
  available. Requesting a minor version `3.4` will automatically correspond to
  the highest available patch number (`3.4.4`).   
-->

|R version | MRAN date  | RStudio version | Debian release |
|----------|------------|-----------------|----------------|
| 3.1.0    | 2014-09-17 | 0.98.1056       | wheezy  (7)    |
| 3.2.0    | 2015-06-18 | 0.99.446        | jessie  (8)    |
| 3.2.5    | 2016-05-03 | 0.99.896        | jessie  (8)    |
| 3.3.0    | 2016-06-21 | 0.99.902        | jessie  (8)    |
| 3.3.1    | 2016-10-31 | 1.0.44          | jessie  (8)    |
| 3.3.2    | 2017-03-06 | 1.0.136         | jessie  (8)    |
| 3.3.3    | 2017-04-21 | 1.0.143         | jessie  (8)    |
| 3.4.0    | 2017-06-30 | 1.0.143         | stretch (9)    |
| 3.4.1    | 2017-09-28 | 1.0.153         | stretch (9)    |
| 3.4.2    | 2017-11-30 | 1.1.383         | stretch (9)    |
| 3.4.3    | 2017-03-15 | 1.1.442         | stretch (9)    |
| 3.4.4    | 2018-04-23 | 1.1.447         | stretch (9)    |
| 3.5.0    | 2018-07-02 | 1.1.447         | stretch (9)    |
| 3.5.1    | 2018-12-20 | 1.1.463         | stretch (9)    |
| 3.5.2    | 2019-03-11 | 1.1.463         | stretch (9)    |
| 3.5.3    | 2019-04-26 | 1.2.1335        | stretch (9)    |
| 3.6.0    | latest     | latest          | stretch (9)    |


