# == Class: git
#
# Manages git
#
# === Parameters:
#
# [*homedir*]
#
# Sets the users home directory.  Ignored if user => false. Default is
# set to '/var/lib/git'
#
# [*manage_homedir*]
#
# Boolean that tells puppet whether it should manage the git users home
# directory
#
# [*user*]
#
# Boolean that tells puppet to manage the git user. Default is false.
#
# [*username*]
#
# The username for the git user.  Default is 'git'
#
class git (
  $homedir = '/var/lib/git',
  $manage_homedir = false,
  $user = false,
  $username = 'git'
) {
  include git::package

  if $user {
    include git::user
  }
}
