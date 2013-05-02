class git::user {
  include git

  $username_r = $git::username
  $homedir_r = $git::homedir
  $manage_homedir_r = $git::manage_homedir

  user { $username_r:
    ensure     => present,
    home       => $homedir_r,
    managehome => $manage_homedir_r,
    before     => File[$homedir_r],
  }

  file { $homedir_r:
    seltype => 'user_home_dir_t',
  }

  file { "${homedir_r}/.ssh":
    ensure  => directory,
    seltype => 'ssh_home_t',
    require => File[$homedir_r],
    owner   => $username_r,
    group   => $username_r,
  }
}
