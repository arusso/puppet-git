class git (
  $create_user = false,
  $user_home = '/var/lib/git',
  $user_name = 'git',
  $manage_user_home = true
) {
  package { 'git': ensure => installed }
  if $create_user {
    user { $user_name:
      ensure     => present,
      home       => $user_home,
      managehome => true,
      before     => File[$user_home],
    }
    file { $user_home:
      seltype => 'user_home_dir_t',
    }
    file { "${user_home}/.ssh":
      ensure  => directory,
      seltype => 'ssh_home_t',
      require => File[$user_home],
      owner   => $user_name,
      group   => $user_name,
    }
  }
}
