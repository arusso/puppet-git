require 'spec_helper'

describe 'git' do
  context 'with no parameters' do
    it do
      should contain_git__package
      should_not contain_git__user
    end
  end

  context 'with user = true' do
    let(:params) { { 'user' => true } }
    it do
      should contain_git__package
      should contain_git__user \
        .with( {
          'username' => 'UNSET',
          'homedir' => 'UNSET',
          'manage_homedir' => 'UNSET' } )
    end
  end

  context 'with user = true, homedir = /home/git, manage_homedir = true' do
    let(:params) { { 'user' => true, 
                     'homedir' => '/home/git',
                     'manage_homedir' => true } }
    it do
      should contain_git__package
      should contain_git__user \
        .with( {
          'username' => 'UNSET',
          'homedir' => '/home/git',
          'manage_homedir' => true } )
    end
  end


  context 'with user = true, username = gituser' do
    let(:params) { { 'user' => true, 'username' => 'gituser' } }
    it do
      should contain_git__package
      should contain_git__user \
        .with( {
          'username' => 'gituser',
          'homedir' => 'UNSET',
          'manage_homedir' => 'UNSET' } )
    end
  end
end
