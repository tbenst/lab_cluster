## STATUS
working through https://docs.docker.com/swarm/configure-tls/#step-8-test-the-swarm-manager-configuration

search TODO for remaining changes, then do Step 8 & 9--should be good to go

Mozart is on .5

## To test:

ansible -i hosts all -m ping --private-key=~/.ssh/master_rsa


## To run:

### main playbook
ansible-playbook -i hosts main.yml

### test playbook
ansible-playbook -i hosts test.yml

### REBOOT
ansible-playbook -i hosts reboot.yml --extra-vars "hosts=all"

### Reset docker containers
ansible-playbook -i hosts --tags=docker main.yml


## Interact with the swarm!
### should fail (no TLS)
sudo docker -H 172.16.37.25:4000 info
sudo docker -H 127.0.0.1:4000 info

### should succeed (from a worker node)
sudo docker -H 172.16.37.25:4000 --tlsverify --tlscacert=/home/vangelderlab/.certs/ca.pem --tlscert=/home/vangelderlab/.certs/cert.pem --tlskey=/home/vangelderlab/.certs/key.pem info

sudo docker -H 192.168.29.242:4000 --tlsverify --tlscacert=/home/vangelderlab/.certs/ca.pem --tlscert=/home/vangelderlab/.certs/cert.pem --tlskey=/home/vangelderlab/.certs/key.pem info



## Misc useful commands
### Manager0 (jimi-hendrix)
docker run -d -p 4000:4000 swarm manage -H :4000 --replication --advertise 172.16.37.25:4000 consul://172.16.37.25:8500

### save SSH 
ssh-agent bash
ssh-add ~/.ssh/master_rsa

### Manager0 (jimi-hendrix)
docker run -d -p 4000:4000 swarm manage -H :4000 --replication --advertise 172.16.37.25:4000 consul://172.16.37.25:8500

### Worker0 (macklemore)
docker run -d swarm join --advertise=172.16.37.141:2375 consul://172.16.37.25:8500

### ssh manager0 (jimi-hendrix)
ssh vangelderlab@172.16.37.25 -p 2424 -i ~/.ssh/master_rsa

### ssh manager1 (soundgarden)
ssh vangelderlab@172.16.37.42 -p 2424 -i ~/.ssh/master_rsa

### ssh worker0 (macklemore)
ssh vangelderlab@172.16.37.141 -p 2424 -i ~/.ssh/master_rsa

### Read x.509 cert
openssl x509 -in ca.pem -noout -text

### Docker
#### Swarm manager status
sudo docker -H :4000 info

#### List processes
sudo docker ps --no-trunc


### working notes
#### create private key for swarm manager
openssl genrsa -out swarm-priv-key.pem 2048
openssl req -subj "/subjectAltName=swarm" -new -key swarm-priv-key.pem -out swarm.csr

#### 
/usr/bin/openssl req -config /usr/lib/ssl/openssl.cnf -new -key /home/vangelderlab/certificate-authority/ca-priv-key.pem -x509 -days 1825 -out /home/vangelderlab/certificate-authority/ca.pem