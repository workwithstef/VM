# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "ansible" do |ansible|
    
    ansible.vm.box = "ubuntu/bionic64"
    ansible.vm.network "private_network", ip:"192.168.10.88"
    
    ansible.vm.synced_folder "./environment/ansible/access/", "/home/ubuntu/access/"
    ansible.vm.synced_folder "./environment/ansible/files/", "/home/ubuntu/files/"
    ansible.vm.synced_folder "./environment/ansible/playbooks/", "/home/vagrant/playbooks/"
    ansible.vm.provision "shell", path: "environment/ansible/provision.sh"
  end
  
  config.vm.define "db" do |db|

    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip:"192.168.10.200"
    db.vm.synced_folder "./environment/db/", "/home/vagrant/db/"

    db.vm.provision "shell", path: "environment/db/provision.sh"

  end

  config.vm.define "app" do |app|

    app.vm.box = "ubuntu/xenial64"

    app.vm.network "private_network", ip:"192.168.10.100"

    app.vm.synced_folder "./environment/app/", "/home/vagrant/app/"
#    app.hostsupdater.aliases = ["stefbooks.local"]
 
    app.vm.provision "shell", path: "environment/app/provision_ansi.sh"



  end

end
