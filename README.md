# lab_cluster
To test:

ansible -i hosts all -m ping --private-key=~/.ssh/master_rsa

To run:

ansible-playbook -i hosts main.yml --ask-sudo-pass
