# Using the rocker/rstudio container

## Quickstart

    docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio

Visit `localhost:8787` in your browser and log in with username `rstudio` and the password you set. **NB: Setting a password is now REQUIRED.**  Container will error otherwise.


Note that all commands documented here work in just the same way with any container derived from `rocker/rstudio`,
such as `rocker/tidyverse`.  

## Common configuration options:


### Use different versions of R

    docker run -d -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio:devel

    docker run -d -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio:3.2.0

See [rocker/r-ver](https://github.com/rocker-org/rocker-versioned) for details.


### Give the user root permissions (add to sudoers)

    docker run -d -p 8787:8787 -e ROOT=TRUE -e PASSWORD=yourpasswordhere rocker/rstudio

Link a local volume (in this example, the current working directory, `$(pwd)`) to the rstudio container:

    docker run -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=yourpasswordhere rocker/rstudio

### Bypassing the authentication step

**Warning: use only in a secure environment**.  Do not use this approach on an
AWS or other cloud machine with a publicly accessible IP address.  


Create an `rserver.conf` script [like the example](rserver.conf) which has the
line `auth-none=1`.  When running docker, map this script to overwrite
`/etc/rstudio/rserver.conf` as shown below.  You will also need to set the
environmental variable `USER=rstudio` at runtime, as shown.

```
docker run 
  --rm -p 127.0.0.1:8787:8787
  -e USER=rstudio 
  -v $(pwd)/rstudio/rserver.conf:/etc/rstudio/rserver.conf 
  rocker/rstudio
```

Navigate to <http://localhost:8787> and you should be logged into RStudio as
the `rstudio` user without needing a password.


### Add shiny server on start up with `e ADD=shiny`

    docker run -d -p 3838:3838 -p 8787:8787 -e ADD=shiny -e PASSWORD=yourpasswordhere rocker/rstudio

shiny server is now running on `localhost:3838` and RStudio on `localhost:8787`.  


Note: this triggers shiny install at runtime, which may require a few minutes to execute before services come up.
If you are building your own Dockerfiles on top of this stack, you should simply include the RUN command:

    RUN export ADD=shiny && bash /etc/cont-init.d/add

Then omit the `-e ADD=shiny` when running your image and shiny should be installed and waiting on port 3838.

**Note**: Please see the `rocker/shiny` and `rocker/shiny-verse` images for
setting up a shiny server in a separate container from RStudio. 


#### Access a root shell for a running `rstudio` container instance

First, determine the name or id of your container (unless you provided a `--name` to `docker run`) using `docker ps`.  You need just enough of the hash id to be unique, e.g. the first 3 letters/numbers.  Then exec into the container for an interactive session:

    docker exec -ti <CONTAINER_ID> bash

You can now perform maintenance operations requiring root behavior such as `apt-get`, adding/removing users, etc.  

Or, simply enable root as shown above and use the RStudio bash terminal.


## Additional configuration options

- Custom user name: `-e USER=<CUSTOM_NAME>`
- Custom user id, group id, UMASK: `-e USERID=<UID>`, `-e GROUPID=<GID>`, `e UMASK=022`


Custom uid/gid etc is usually only needed when sharing a local volume for a user/group whose id does not match the default (`1000`:`1000`).  Failing to do this could make files change permissions on the linked volume when accessed from RStudio. 


Adding additional users:  From a root bash shell (see above), the usual debian linux commands can be used to create new users and passwords, e.g. 

## Developers / Dockerfile authors

The RStudio images use the `s6-init` system to run multiple/persistant jobs.  While init systems like supervisord are better known, `s6` is powerful, lightweight, easy to use, and plays nicely with docker (e.g. avoiding the pid 1 / zombie problem).  See [s6-overlay](https://github.com/just-containers/s6-overlay) for details if you need to add additional services (such as an sshd server) or custom start-up, shut down, or logging scripts.  

## More help

See the Wiki for additional documentation and use cases: <https://github.com/rocker-org/rocker/wiki>


