#!/bin/bash

if [ ! -f Vagrantfile ]; then
    echo "ERROR: Need to run this in the proejct root"
      exit 1
fi


if [ ! -d ./tmp ]; then
    echo "./tmp not found, creating"
      mkdir tmp
fi

echo "Building VM"
vagrant up

echo "Building box file"
vagrant package --output tmp/dev-vm.box
