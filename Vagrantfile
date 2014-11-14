Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "shell", privileged: false, inline: <<-EOS
    set -e -x
    sudo apt-get -qq update
    sudo apt-get install -y git ruby-dev build-essential libxml2-dev libxslt1-dev
    sudo gem install --no-ri --no-rdoc bundler
    mkdir -p /usr/share/puppet/modules
    sudo chown vagrant /usr/share/puppet/modules
    [ ! -e /usr/share/puppet/modules/arcanist ] && ln -s /vagrant /usr/share/puppet/modules/arcanist
    (
      cd /vagrant
      bundle
      bundle exec librarian-puppet install --path /usr/share/puppet/modules
    )
    sudo touch /etc/puppet/hiera.yaml
  EOS
end
