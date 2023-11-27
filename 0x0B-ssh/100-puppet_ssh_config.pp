#!/usr/bin/env bash
# changing configuration file using puppet

file { 'etc/ssh/ssh_config':
        ensure => present,

content =>"

        #SSH client configuration
        host*
        IdentityFile ~/.ssh/school
        PasswordAuthentication no

}