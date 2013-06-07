require 'spec_helper'

describe 'git::user' do
  context 'with no params' do
    it do
      # our git user
      should contain_user('git') \
        .with( {
          'ensure'=>'present',
          'home' => '/var/lib/git',
          'managehome' => false } )

      # the homedir
      should contain_file('/var/lib/git') \
        .with( { 'seltype' => 'user_home_dir_t' } )

      # the sshdir
      should contain_file('/var/lib/git/.ssh') \
        .with( {
          'ensure' => 'directory',
          'seltype' => 'ssh_home_t',
          'owner' => 'git',
          'group' => 'git' } )
    end
  end
end
