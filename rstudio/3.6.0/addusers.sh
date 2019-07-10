#!/usr/bin/with-contenv bash

## set user names and passwords here
## then link this to: /etc/cont-init.d/addusers

users=( )
passwords= ( )

N=${#users[@]}
for((i=0;i<${N};i++))
do
        USER="users[$i]"
        PW="passwords[$i]"
        useradd -m ${!USER}
        usermod -aG staff ${!USER}
        echo "${!USER}:${!PW}" | chpasswd
done


