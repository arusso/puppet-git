# Introduction

[![Build Status](https://travis-ci.org/arusso/puppet-git.png?branch=master)](https://travis-ci.org/arusso/puppet-git)

This is a simple git module that installs the git packages, and can be
used to setup a git user account and homedir

## Examples

```
# just install the git package
include git

# install the git package and setup the user
class { 'git':
  homedir        => '/home/git', # defaults to /var/lib/git
  manage_homedir => true,  # defaults to false
  user           => true,  # defaults to false
  username       => 'git', # this is the default
}
```
