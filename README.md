# Vagrant Neo4j

A [vagrant](http://vagrantup.com) configuration to run Neo4j in a VirtualBox.

The setup script is a simple bash shell script (no chef/puppet/etc). I wanted a simple, lightweight, and standalone script to build my environment, but it may not be appropriate for everyone's needs.

## Installs

Running `vagrant up` will download and install:

* Ubuntu 18.04 LTS (Base Box) `precise64 http://files.vagrantup.com/bionic64.box`

* [OpenJDk8]
* [Neo4j]Community Edition

## Requirements

* [VirtualBox](https://www.virtualbox.org/) (version 4.2 or later)
* [Vagrant](http://www.vagrantup.com/)
