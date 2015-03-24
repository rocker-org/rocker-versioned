library(crandb)
library(magrittr)
skip_lines <- function(text, head = 1e6, tail = 1e6) {
    text <- strsplit(text, "\n")[[1]]
    tail <- min(tail, max(0, length(text) - head))
    skip_text <- if (length(text) > head + tail) {
        paste("\n... not showing", length(text) - head - tail, "lines ...\n")
    } else {
        character()
    }
    c(head(text, head), skip_text, tail(text, tail)) %>%
        paste(collapse = "\n")
}
DB <- function(api, head = 1e6, tail = head) {
  paste0("http://db.r-pkg.org", "/", api) %>%
    httr::GET() %>%
    httr::content(as = "text", encoding = "UTF-8") 
}


library(RJSONIO)
vers = fromJSON(DB("/-/release/2.15.3", head=20))

tarnames = paste0(names(vers), "_", vers, ".tar.gz")

## some packages haven't been updated since 2.15.3, so they are in CRAN rather
## than the archive.

avail = available.packages()
stillthere = which(names(vers) %in% avail[,"Package"])
currentpkgs = avail[names(vers)[stillthere], "Version"] == vers[stillthere]

iscurrent = rep(FALSE, times=length(vers))
iscurrent[stillthere[currentpkgs]] = TRUE

baseurl = ifelse(iscurrent, "http://cran.rstudio.com/src/contrib",
    paste("http://cran.r-project.org/src/contrib/Archive", names(vers), sep="/")
    )
cranurls = paste(baseurl, tarnames, sep = "/")

library(switchr)
man = Manifest(name = names(vers), type = "tarball", subdir = ".", branch = NA, url = cranurls,
    dep_repos = character())

switchTo("R2.15.3Lib")
Install("devtools", man)
