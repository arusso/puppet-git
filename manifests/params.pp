# == Class: git::params
#
# Default parameters for git and its sub-classes
#
class git::params {
  $username = 'git'
  $homedir = '/var/lib/git'
  $manage_homedir = false
  $package = true
  $user = false
}
