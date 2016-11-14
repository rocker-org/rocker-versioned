#!/usr/bin/env Rscript
#
# A simple example to install one or more packages
# Copyright (C) 2006 - 2015  Dirk Eddelbuettel
# Modified 2016 Carl Boettiger
# Released under GPL (>= 2)

argv <- commandArgs(TRUE)

if (is.null(argv) | length(argv) < 1) {
    cat("Usage: installr.r pkg1 [pkg2 pkg3 ...]\n\n")
    cat("Set environment variables REPOS and LIBLOC to overrride defaults.\n")
    cat("Installs pkg1, ... from existing files with matching extension.\n")
    q()
}

## adjust as necessary, see help('download.packages')
repos <- Sys.getenv("REPOS")
if( repos == "") repos <- getOption("repos")


withCallingHandlers(
  sapply(argv, install.packages, repos = repos, dep = as.logical(Sys.getenv("INCLUDE_SUGGESTS"))), 
  warning = stop)

## clean up any temp file containing CRAN directory information
sapply(list.files(path = tempdir(), pattern = "^(repos|libloc).*\\.rds$", full.names = TRUE), unlink)
