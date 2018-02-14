#!/usr/bin/env sh

## Enforces the custom password specified in the PASSWORD environment variable when rocker RStudio is run as a Singularity container.
## The accepted RStudio username is the same as the USER environment variable (i.e., local user name).
## example: PASSWORD='...' singularity exec IMAGE rserver --auth-none 0 --auth-pam-helper-path=auth_singularity

set -o nounset

IFS='' read -r password

[ "${USER}" = "${1}" ] && [ "${PASSWORD}" = "${password}" ]
