#!/usr/bin/env bash
# changing configuration file using puppet

file { 'ect/ssh/ssh_cofig':
        ensure => present,

content =>"

        #SSH client configuration
        host*
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
	",

}
