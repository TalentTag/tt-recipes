package "libssl-dev"

ruby_version = "2.1.4"
# node.default[:rbenv][:user_installs] = [
#     {
#         :user => "rbdev",
#         :rubies => [ ruby_version ],
#         :global => ruby_version,
#         :gems => {
#             ruby_version => [ { :name => "bundler" } ]
#         }
#     }
# ]
# include_recipe "rbenv::user"

include_recipe "rbenv::system"
include_recipe "ruby_build"
# ruby_build_ruby "2.1.4"
rbenv_ruby ruby_version
rbenv_global ruby_version

rbenv_gem "bundler"

# ruby_build_ruby "2.1.4" do
#     prefix_path "/usr"
#     action :reinstall
#     not_if { `ruby --version`.start_with? "ruby 2.1.4" }
# end

# gem_package "bundler"

# rbenv_ruby "2.1.4"
# # rbenv_global "2.1.4"


