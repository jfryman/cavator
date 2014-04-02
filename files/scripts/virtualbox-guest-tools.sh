#!/usr/bin/env bash
#  Script used to install any guest utilities that need to be present

# Installs the virtualbox guest additions
if [ `facter virtual` = 'virtualbox' ]; then
  apt-get -y install dkms
  VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
  cd /tmp
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
  mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  sh /mnt/VBoxLinuxAdditions.run
  umount /mnt

  rm VBoxGuestAdditions_$VBOX_VERSION.iso
fi
