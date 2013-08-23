require 'rake'

exclude_paths = [
  "pkg/**/*.pp",
  "spec/**/*.pp",
]

begin
  require 'rspec/core/rake_task'
  require 'puppet-lint/tasks/puppet-lint'
  require 'puppet-syntax/tasks/puppet-syntax'
  PuppetLint.configuration.ignore_paths = exclude_paths
  PuppetLint.configuration.send("disable_80chars")
  PuppetSyntax.exclude_paths = exclude_paths
rescue LoadError
  require 'rubygems'
  retry
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Run lint, syntax and spec testing"
task :default => [:lint,:syntax,:spec]
