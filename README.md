# lab_cluster
To test:

ansible -i hosts all -m ping --private-key=~/.ssh/master_rsa


To run:

ansible-playbook -i hosts main.yml
ansible-playbook -i hosts test.yml
ansible-playbook -i hosts reboot.yml --list-hosts  --extra-vars "hosts=all"



ssh-agent bash
ssh-add ~/.ssh/master_rsa