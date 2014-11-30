# -*- mode: ruby -*-
# vi: set ft=ruby :

box = "trusty"

Vagrant.configure("2") do |config|
    config.vm.box = box
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/#{box}/current/#{box}-server-cloudimg-amd64-vagrant-disk1.box"
    config.cache.auto_detect = true
    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 4
    end
    config.vm.provision :shell, :inline => "chef-solo --version || wget -qO - https://www.opscode.com/chef/install.sh | sudo sh; [ -n \"$(find /var/cache/apt/pkgcache.bin -mmin -60)\" ] || sudo apt-get -qq update"
    # config.berkshelf.enabled = true
    config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "talenttag"
      chef.verbose_logging = true
    end
    config.ssh.forward_agent = true
    config.vm.network :forwarded_port, guest: 3000, host: 3000
end
