# == Class: git::package
#
# Installs the necessary packages to use git
#
class git::package {
  package { 'git': ensure => installed }
}
