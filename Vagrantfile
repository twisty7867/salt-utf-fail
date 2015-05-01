Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu-trusty-x64"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.synced_folder "srv", "/srv"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.hostname = "salt-utf-fail-#{`hostname`[0..-2]}"

    config.vm.provider "virtualbox" do |vb|
        vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
    end

    config.vm.provision "fix-no-tty", type: "shell" do |s|
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end

    config.vm.provision "salt", type: "salt" do |salt|
        log_level = "warning"
        salt.minion_config = "srv/minion"
        salt.run_highstate = true
        salt.install_type = "git"
        salt.install_args = "v2015.2.0rc2"
        salt.bootstrap_options = "-G"
    end
end