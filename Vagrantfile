# -​*- mode: ruby -*​-
# vi: set ft=ruby :

require_relative './bootstrap'

Vagrant.configure("2") do |config|

   $config['nodes'].each do | machine_name, machine | 
     config.vm.define "#{machine_name}" do |node|
      
      node.vm.provider :linode do |provider, override|
         override.ssh.private_key_path = '~/.ssh/id_rsa'
         override.vm.box = 'linode'
         override.vm.box_url = "https://github.com/displague/vagrant-linode/raw/master/box/linode.box"
         provider.distribution = "#{machine['distribution']}"
         provider.datacenter = "#{machine['datacenter']}"
         provider.plan = "#{machine['plan']}"
         provider.label = "#{machine['label']}"
         override.vm.provision "shell",:args=> ["#{machine['label']}","#{machine['nodetoken']}"], :path => File.join(File.dirname(__FILE__),"_support/vagrant/#{machine['role']}/linode.sh")
         override.vm.provision "shell",:args=> ["#{machine['label']}","#{machine['nodetoken']}"], :path => File.join(File.dirname(__FILE__),"_support/vagrant/#{machine['role']}/#{machine['role']}.sh")
       end
     end  
   end   
end