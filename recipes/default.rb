include_recipe "op"
include_recipe "nginx"
include_recipe "ruby_build"

package "postgresql"
package "postgresql-contrib"
package "sphinxsearch"
package "nodejs"
# package "unicorn"
package "libssl-dev"
package "redis-server"
# package "rbenv"
package "build-essential"
package "libmysqlclient-dev"
package "libpq-dev"

# include_recipe "rbenv::system"

ruby_build_ruby "2.1.4" do
    prefix_path "/usr"
    action :reinstall
    not_if { `ruby --version`.start_with? "ruby 2.1.4" }
end

gem_package "bundler"

# node.default[:rbenv] = {
#     :rubies => [ "2.1.4" ],
#     :global => "2.1.4"
# }
# rbenv_ruby "2.1.4"
# # rbenv_global "2.1.4"
