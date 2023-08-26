# Inception of Things

This repository gathers three little projects using Vagrant, Kubernetes and
more.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Part 1: Automate a simple k3s cluster with Vagrant](#part-1-automate-a-simple-k3s-cluster-with-vagrant)
3. [Part 2](#part-2)
4. [Part 3](#part-3)

## Prerequisites

Before proceeding with the setup, ensure you have the following prerequisites on your host machine:
- **Vagrant** installed, and
- **VirtualBox** (or any other Vagrant provider) installed for virtualization capabilities.

## Part 1: Automate a simple K3s cluster with Vagrant

The first project *p1* involves automating a 2-machine cluster using *k3s* and *vagrant*.

K3s is a lightweight virtual machine-based Kubernetes distribution tool made for IoT and CI/CD environments.

### Setting up the Virtual Machines

In part1, we define two boxes: a server and a worker.Vagrant helps us automate the creation and provisioning of multiple virtual machines from one configuration file: the Vagrantfile.
Both boxes run the latest stable Ubuntu Operating System and run on 1 CPU and 1024 MB of RAM.
Their hostnames and IP addresses are defined at the top of the file. 

```ruby
SERVER_IP = "192.168.56.110"
WORKER_IP = "192.168.56.111"
SERVER_NAME = "corozcoS"
WORKER_NAME = "corozcoSW"
TOKEN_FILE = "/vagrant/node-token"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.define "#{SERVER_NAME}" do |control|
    control.vm.hostname = "#{SERVER_NAME}"
    control.vm.network "private_network", bridge: "enp0s8", ip: "#{SERVER_IP}"
  end

  config.vm.define "#{WORKER_NAME}" do |control|
    control.vm.hostname = "#{WORKER_NAME}"
    control.vm.network "private_network", bridge: "enp0s8", ip: "#{WORKER_IP}"
  end
end
```

### Deploying the k3s cluster 

Once our machines are up and running, we can configure the k3s cluster.

#### Server node


```ruby
# Initialize a new cluster using etcd specifying the node's advertising address 
# Copy the node-token to the host machine
$serverscript = <<-SCRIPT
apt-get update
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--cluster-init --node-ip #{SERVER_IP}" sh -
cp /var/lib/rancher/k3s/server/node-token /vagrant
SCRIPT

# We run this script on the server machine
control.vm.provision "shell", inline: $serverscript
```

```ruby
# Initialize a new cluster using etcd specifying the node's advertising address 
# Copy the node-token to the host machine
$serverscript = <<-SCRIPT
apt-get update
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--cluster-init --node-ip #{SERVER_IP}" sh -
cp /var/lib/rancher/k3s/server/node-token /vagrant
SCRIPT

# We run this script on the node server
control.vm.provision "shell", inline: $nodescript
```
## Part 2: 

## Part 3: 
- create VM
- install docker, k3d, kubectl etc
- 
K3d deploys Docker-based k3s Kubernetes clusters.
