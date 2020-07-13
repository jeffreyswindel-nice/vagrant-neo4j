# Vagrant Neo4j

A [vagrant](http://vagrantup.com) configuration to run Neo4j in a VirtualBox.

Provisions the VM with an Ansible playbook that installs neo4j, python-neo4j, and various other tools

## Installs

Running `vagrant up` will download and install:

* [Ubuntu](http://ubuntu.com) 18.04 LTS (Base Box) `bionic64 http://files.vagrantup.com/bionic64.box`
* [OpenJdk8](https://openjdk.java.net/)
* [Neo4j](https://neo4j.com/) Community Edition

## Requirements

* [VirtualBox](https://www.virtualbox.org/) (version 4.2 or later)
* [Vagrant](http://www.vagrantup.com/)
