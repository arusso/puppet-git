# == Class: git::user
#
# Configures the git user, and sets up the home directory and .ssh folder
#
class git::user (
  $username = 'UNSET',
  $homedir = 'UNSET',
  $manage_homedir = 'UNSET'
) {
  include git::params

  $username_real = $username ? {
    'UNSET' => $git::params::username,
    default => $username
  }

  $homedir_real = $homedir ? {
    'UNSET' => $git::params::homedir,
    default => $homedir
  }

  $manage_homedir_real = $manage_homedir ? {
    'UNSET' => $git::params::manage_homedir,
    default => $manage_homedir
  }

  user { $username_real:
    ensure     => present,
    home       => $homedir_real,
    managehome => $manage_homedir_real,
    before     => File[$homedir_real],
  }

  file { $homedir_real:
    seltype => 'user_home_dir_t',
  }

  file { "${homedir_real}/.ssh":
    ensure  => directory,
    seltype => 'ssh_home_t',
    require => File[$homedir_real],
    owner   => $username_real,
    group   => $username_real,
  }
}
