# Lab Cluster

Sets up a cluster of machines with [Docker Swarm](https://www.docker.com/products/docker-swarm) and [CephFS](https://en.wikipedia.org/wiki/Ceph_\(software\)) using [Ansible](http://docs.ansible.com/ansible/index.html).

IP addresses must be manually specified in the hosts file.

To deploy, ubuntu 16.04 must be installed on all target hosts & the setup shell script must be manually run on each machine.

## Connecting
How to mount CephFS:
sudo mount -t ceph 172.16.37.42:6789:/ /cephfs

How to connect to Docker Swarm:
sudo docker --tlsverify --tlscacert=/home/vangelderlab/.certs/ca.pem --tlscert=/home/vangelderlab/.certs/cert.pem --tlskey=/home/vangelderlab/.certs/key.pem -H 172.16.37.25:4000 version
