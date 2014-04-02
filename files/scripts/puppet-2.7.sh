#!/usr/bin/env sh

echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

apt-get install -y build-essential curl wget libssl-dev autoconf automake autotools-dev bison libbison-dev git

apt-key list | grep -q 0CC30EA6 || {
  wget http://packages.iad.github.net:9999/freight/pubkey.gpg -O - | apt-key add -
}

test -f /etc/apt/sources.list.d/100github.list || {
  echo "deb http://packages.iad.github.net:9999/freight precise main" >> /etc/apt/sources.list.d/100github.list
}

apt-get update
apt-get upgrade -y

if [ ! -f puppetlabs-release-precise.deb ]; then
  wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs-release-precise.deb
  apt-get update
fi

if [ ! $(which puppet) ]; then
  apt-get install -y puppet=2.7.23-1puppetlabs1 puppet-common=2.7.23-1puppetlabs1 hiera-puppet rubygems
  gem install bundler --no-ri --no-rdoc
fi
