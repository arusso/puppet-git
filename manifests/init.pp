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
  $homedir = 'UNSET',
  $manage_homedir = 'UNSET',
  $user = 'UNSET',
  $username = 'UNSET',
  $package = 'UNSET'
) {
  include git::params

  $package_real = $package ? {
    'UNSET' => $git::params::package,
    default => any2bool($package),
  }

  $user_real = $user ? {
    'UNSET' => $git::parmas::user,
    default => any2bool($user),
  }

  if $package_real { include git::package }
  if $user_real {
    class { 'git::user':
      homedir        => $homedir,
      manage_homedir => $manage_homedir,
      username       => $username,
    }
  }
}
