Vagrant.configure("2") do |config|
  vm_box = "ubuntu/bionic64"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
  end
  
  config.ssh.insert_key = false
  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
  
  config.vm.define "vagrant-neo4j" do |master|
      master.vm.box = vm_box
      master.vm.hostname = "noe4j-dev"
      master.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
      master.vm.provision "shell", inline: <<-EOC
          sudo sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
          sudo systemctl restart sshd.service
          echo "finished"
      EOC
      master.vm.network :forwarded_port, guest: 7474, host: 7474
      master.vm.network :forwarded_port, guest: 7687, host: 7687
      #master.vm.provision :shell, :path => "provision/setup.sh"
      master.vm.provision "ansible" do |ansible|
        ansible.compatibility_mode = '2.0'
        ansible.playbook = "provision/ansible/neo4j.yml"
        ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
    end
  end
end