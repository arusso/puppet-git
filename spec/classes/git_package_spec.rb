require 'spec_helper'

describe 'git::package' do
  it do
    should contain_package('git').with({'ensure'=>'installed'})
  end
end
