# installing prereq on ubuntu
# docs
# https://docs.ansible.com/ansible/latest/getting_started/index.html

sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible sshpass
ansible --version

# ansible config
# The effective Ansible configuration is applied on the first found – first applied basis. 
# It is important to note that only one configuration can be active and applied 
# and that these configurations are NOT cumulative.
# The search order is shown in the following bulleted list, 
# with the search from the top of the list to the bottom. 
# The least effective configuration is the /etc/ansible/ansible.cfg at the bottom of the list.
# ANSIBLE_CONFIG: 
#    If the environment variable, ANSIBLE_CONFIG, is set, then this configuration is used. 
#    Default options are used for any configuration option not set. 
#    This default behavior is common with all configurations.
# ansible.cfg: 
#    If there is an ansible.cfg file in the current working directory (CWD), 
#    AND the ANSIBLE_CONFIG environment variable has not been set, 
#    then it is this file that is used.
# ~/.ansible.cfg: 
#    If no previously listed configuration is detected, 
#    Ansible will check the current user’s home directory for a hidden file called .ansible.cfg. 
#    If the file exists, then it becomes the third choice within the hierarchy. 
#    This is a great option for a user to create, acting as a default for all user projects 
#    except those needing a little tweaking. 
#    Those needing tweaks can have a configuration file added to the project directory;
#    alternatively, as you will learn, variables can be set to
#    overwrite certain options as can settings within Ansible Playbooks. 
#    So, there are lots of options to tweak the configuration as needed.
# /etc/ansible/ansible.cfg: 
#    The default file where no other configuration is in place or detected. 
#    The file itself only contains comments, 
#    meaning that there are no effective settings from the file. 
#    This will result in the default settings being applied for all settings. 
#    The file itself is not wasted, acting as great documentation 
#    for the configuration files that you may want to implement.

# config example
$ vim $HOME/.ansible.cfg
[defaults]
remote_user = ansible ; we will later create this account 
inventory = $HOME/inventory ; list of remote hosts
[inventory]
[privilege_escalation]
become = true ; user rights will be elevated
become_method = sudo ; by using sudo
[paramiko_connection]
[ssh_connection]
[persistent_connection]
[accelerate]
[selinux]
[colors]
[diff]

# sample inventory
cat /etc/ansible/hosts

