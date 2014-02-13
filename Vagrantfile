# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$installPuppetYumRepoScript = <<SCRIPT
echo "[puppetlabs]
name=Puppet Labs Packages
baseurl=http://yum.puppetlabs.com/el/6/products/x86_64/
enabled=1
gpgcheck=1
gpgkey=http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs" > /etc/yum.repos.d/puppet.repo
SCRIPT

$installPuppetDepsYumRepoScript = <<SCRIPT
echo "[puppetdeps]
name=Puppet Dependencies Packages
baseurl=http://yum.puppetlabs.com/el/6/dependencies/x86_64/
enabled=1
gpgcheck=1
gpgkey=http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs" > /etc/yum.repos.d/puppet.deps.repo
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'centos-6.5_64'
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box'

  # Sync maven dir
  # config.vm.synced_folder '~/.m2', '/home/vagrant/.m2'

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  config.vm.provision 'shell', inline: $installPuppetYumRepoScript
  config.vm.provision 'shell', inline: $installPuppetDepsYumRepoScript
  config.vm.provision 'shell', inline: 'yum install -y ruby rubygems man puppet wget' # install puppet
  config.vm.provision 'shell', inline: "echo 'Done'"

  config.vm.provision 'puppet' do |puppet|
    #puppet.options = '--verbose --debug'
    puppet.manifests_path = 'src/puppet/manifests'
    puppet.manifest_file = 'default.pp'
    puppet.module_path = 'src/puppet/modules'
  end

  config.vm.provision 'shell', inline: './install-jdk.sh'
  config.vm.provision 'shell', inline: './install-maven.sh'
end
