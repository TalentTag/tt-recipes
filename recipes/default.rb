include_recipe "op"
include_recipe "op::exim-minimal"
include_recipe "nginx"
include_recipe "talenttag::ruby"

package "postgresql"
package "postgresql-contrib"
package "nodejs"
package "libssl-dev"
package "redis-server"
package "build-essential"
package "libmysqlclient-dev"
package "libpq-dev"
package "libreadline-dev"

group "rbdev" do
    gid 501
    not_if "grep deploy /etc/group"
end

user "rbdev" do
    uid 501
    gid "rbdev"
    shell "/bin/bash"
    home "/home/rbdev"
    supports :manage_home => true
    manage_home true
    not_if "id rbdev"
end

package "debian-archive-keyring"

apt_repository "sid" do
    uri "http://ftp.de.debian.org/debian"
    distribution "sid"
    components ["main"]
end

package "sphinxsearch" do
    version "2.2.5-1"
    options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
end

simple_iptables_rule "permitted" do
    rule "--proto tcp --dport 3000"
    jump "ACCEPT"
end

