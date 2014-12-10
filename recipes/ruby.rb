package "libssl-dev"

ruby_version = "2.1.4"

include_recipe "rbenv::system"
include_recipe "ruby_build"
rbenv_ruby ruby_version
rbenv_global ruby_version

rbenv_gem "bundler"
