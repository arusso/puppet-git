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
      should contain_git__user
    end
  end
end
