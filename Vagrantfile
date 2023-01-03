LOCAL_IP='192.168.56.10'

Vagrant.configure('2') do |config|
  config.vm.box = 'debian/buster64'
  config.vm.hostname = 'docker.local'
  config.vm.network 'private_network', ip: LOCAL_IP
  config.vm.network 'forwarded_port', guest: 2375, host: 2375, id: 'dockerd'

  # Proxy setup 
  # comment out `config.proxy.*` if you are not using a proxy
  config.proxy.http     = Secret.proxy
  config.proxy.https    = Secret.proxy
  config.proxy.no_proxy = 'localhost,127.0.0.1'

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'docker-machine'
    vb.memory = '2048'
    vb.cpus = '2'
  end
  
  # config.vm.provision 'shell', path: 'provision.sh'
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "docker-playbook.yml"
    ansible.verbose = "vv"
  end

  config.trigger.after [:provision] do |trigger|
    trigger.info = "Running ./post-provision.sh locally..."
    trigger.run = {
      path: "./post-provision.sh",
      args: LOCAL_IP
    }
  end
  
  # Configuration for Port Forwarding
  # Uncomment or add new ones here as required
  # config.vm.network 'forwarded_port', guest: 6379, host: 6379, id: 'redis'
  # config.vm.network 'forwarded_port', guest: 3306, host: 3306, id: 'mysql'
end
