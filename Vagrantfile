# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.hostname = 'radiology.openmrs.org'
  # Alternatively, use provider.name below to set the Droplet name. config.vm.hostname takes precedence.
  
  # tomcat port (openmrs)
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider :virtualbox do |provider, override|
    override.vm.box = 'ubuntu/trusty64'
    provider.gui = false
    provider.memory = "2048"
    provider.name = "ubuntu1404-docker-openmrs-module-radiology"
    override.vm.provision "shell",
     path: "bootstrap.sh"
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa_do_20160623'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.image = ENV["DO_PROVIDER_IMAGE"]
    provider.region = 'ams2'
    provider.size = '2gb'
    provider.token = ENV["DO_API_TOKEN"]
    override.vm.provision "shell",
     path: "run.sh"
  end
end
