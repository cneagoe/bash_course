# vagrant setup on wsl
sudo apt install vagrant
# you can get specific version with following command 
sudo apt-get install vagrant=2.4.0-1
# vagrant version must match beween win and wsl
# in .bashrc add the following
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
# install plugin
vagrant plugin install virtualbox_WSL2

# sample vagrant file
# remember to run vagrant destroy before updating vagrant file
# or used vagrant reload
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define :server1 do |server1|
      server1.vm.hostname = "server1"
      server1.vm.box = "generic/centos9s"
      server1.vm.network "private_network", ip: "192.168.56.1"
    end
    
    config.vm.define :server2 do |server2|
      server2.vm.hostname = "server2"
      server2.vm.box = "generic/centos9s"
      server2.vm.network "private_network", ip: "192.168.56.2"
    end
    
    config.vm.provision "ansible" do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.verbose = "v"
      ansible.playbook = "playbook.yml"
      # ansible.inventory_path = "inventory"
      ansible.become = true
    end
    
  end

# https://blog.thenets.org/how-to-run-vagrant-on-wsl-2/
# https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html

# docs
# https://docs.ansible.com/ansible/latest/getting_started/index.html

# installing prereq on ubuntu
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
dnf config-manager --add-repo https://github.com/ansible-community/ppa
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
# you can use default cfg file for now
# no need to change anything here
$ code $HOME/.ansible.cfg
[defaults]
remote_user = vagrant
# host_key_checking = false
inventory = inventory
[privilege_escalation]
become = True
become_method = sudo
become_user = root
become_ask_pass = False

# first playbook
$ vim software.yml
---
- name: My first play
  hosts: all
  become: true
  tasks:
  - name: Install software
    package:
      name: bash-completion
      state: present
...

# sample generic inventory
cat /etc/ansible/hosts

# vagrant inventory 
# .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
server2 ansible_host=172.26.144.1 ansible_port=2200 ansible_user='vagrant' ansible_ssh_private_key_file='/home/cip/.vagrant/machines/server2/virtualbox/private_key'
server1 ansible_host=172.26.144.1 ansible_port=2222 ansible_user='vagrant' ansible_ssh_private_key_file='/home/cip/.vagrant/machines/server1/virtualbox/private_key'

# take the default vagrant inventory 
# move it in your working directoy
cp .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ./inventory

# add inventory hostgroups
[web]
server2 ansible_host=172.26.144.1 ansible_port=2200 ansible_user='vagrant' ansible_ssh_private_key_file='/home/cip/.vagrant/machines/server2/virtualbox/private_key'
[db]
server1 ansible_host=172.26.144.1 ansible_port=2222 ansible_user='vagrant' ansible_ssh_private_key_file='/home/cip/.vagrant/machines/server1/virtualbox/private_key'
[servers:children]
db
web

# add this line in the ansible section of your vagrant file
ansible.inventory_path = "inventory"

# test config using 
vagrant reload
vagrant provision

# tips
# Keep it simple: At its launch, Ansible was
# positioned as a solution that is simpler than the
# others. That goes for the playbooks and other
# solutions you’ll develop as well. Keep it simple, and
# it will be easier for others to understand what you
# had in mind.
# • Make it readable: As with anything in IT, you can
# make it very complex and use compact structures to
# ensure that nobody understands what you were
# trying to do. That approach doesn’t make sense. You
# should keep it readable, and that starts with your
# development of Ansible playbooks.
# • Use a declarative approach: In Ansible, it’s all
# about the desired state. The purpose of Ansible is to
# bring managed assets in the desired state,
# regardless of the current state, and make only the
# modifications that are necessary. The desired state
# is implemented in playbooks, and using playbooks
# to make the current state match the desired state is
# what is known as the declarative approach.
# • Use specific solutions: On many occasions, you’ll
# find that multiple solutions are available to reach a
# specific desired state. For instance, you can use the
# command module to run arbitrary commands,
# making it possible to accomplish almost anything.
# You shouldn’t, though. To make sure that you get
# the desired result, use the most specific solution. So
# if, for instance, a user module allows you to create
# users, use that module and don’t use the Linux
# useradd command with the command module.


# inventory commands
ansible -i inventory all --list-hosts
# list all servers in human readable format
ansible -i inventory ungrouped --list-hosts
# list only ungrouped servers
ansible-inventory -i inventory --list
# list in json format
ansible-inventory -i inventory --graph
# list hierarchy

# we can used dinamic inventories in larger environments
# https://docs.ansible.com/ansible/latest/inventory_guide/intro_dynamic_inventory.html

# ad hoc commands
ansible all -i inventory -b -m user -a "name=lisa"

# core modules.

# command
# The command module allows users to run arbitrary
# commands using Ansible. Commands that are run by the
# command module are not interpreted by a shell. This
# means that common shell features, such as pipes and
# redirects, don’t work while using the command module.
# For instance, the command ansible all -m command -
# a “rpm -qa | grep nmap” does not work.
# The command module is the default module. This means
# that if the option -m command is omitted, Ansible
# interprets the argument that is provided by default as an
# argument to the command module. If another default
# module is needed, the option module_name = module
# can be set in ansible.cfg.

# shell
# The shell module is similar to the command module and
# allows you to run arbitrary commands, with one
# important difference: the shell module does run the
# commands through a shell. That means the usual shell
# features, such as pipes and redirects, do work while using
# this module. Compare, for instance, the result of the
# command ansible all -m shell -a “rpm -qa | grep
# nmap” to the command used before. This time it will work.

# raw
# The third module that enables you to run arbitrary
# commands on managed nodes is the raw module. The
# shell and the command modules, when used, generate a
# Python script, which is sent over SSH to be executed on
# the managed host. The raw module, however, doesn’t
# need Python on the managed host; it sends the command
# straight over the SSH connection. This makes the raw
# module an excellent choice while setting up a machine or
# to work on a managed machine that doesn’t have a
# Python stack, such as a network device.
# Using the appropriate options, you can use the raw
# module to perform initial setup tasks on managed hosts.
# An example is the command ansible -u root -i
# inventory ansible3 --ask-pass -m raw -a “yum
# install python3”, which can be used to install Python 3
# on host ansible3, which may be a node that hasn’t
# received any Ansible configuration yet. Notice that the
# raw module could be used as an alternative to the
# command or shell module, but this approach is not
# recommended. As a generic rule of thumb, you should
# always try to use the module that is the most specific for
# the task that you want to accomplish.

# copy
# As its name suggests, the copy module is used to copy
# things. You can use it to copy files, but you can also use it
# to copy simple lines of text into a managed files. An
# example is ansible all -m copy -a 'content="hello
# world" dest=/etc/motd', which copies the text “hello
# world” into the /etc/motd file.

# yum
# The yum module can be installed to manage software on
# the Red Hat distribution and related distributions. Use,
# for example, ansible all -m yum -a “name=nmap
# state=latest” to install the latest version of the nmap
# package on all managed nodes. Notice that yum is not
# the only module available for managing software. A more
# generic module is package, which has the advantage that
# it works on any Linux distribution. Between the two of
# them, use the yum module if you need to work with
# specific yum command features, and use the package
# module if the highest priority is to manage software on
# different managed distributions.

# service
# The service module is used to manage the state of
# services through either the legacy system V (init)
# process, or systemd. While using it, make sure that you
# don’t just start the service using the argument
# state=started, but also enable the service using
# enabled=yes. If you just use state=started, the managed
# service is started now but won’t be started automatically
# again after a restart. It’s like using systemctl start
# myservice without using systemctl enable myservice.
# Use, for instance, ansible all -m service -a
# “name=httpd state=started enabled=yes” to
# enable and start the httpd service. (Obviously, you have
# to use the yum module to install the httpd service before
# you can do that.)

# ping
# The ping module is a simple module that can be used to
# check whether hosts have been set up correctly to be
# managed with Ansible. So it doesn’t just test
# connectivity; it tests manageability. It doesn’t need any
# arguments. Just use ansible all -m ping to check
# connectivity for all hosts in inventory. Listing 4-2 shows
# what the answer looks like for hosts that are available but
# also shows what you see if a host is not available. To get
# the same result, just add the hostname ansible3 to the
# inventory file. In Exercise 4-2 you can practice working
# with this module as well as the other modules discussed
# here.

# 1. Use 
ansible all -m ping 
# to verify that all hosts in inventory are in a manageable state.
# 2. Type 
ansible web -m yum -a "name=httpd state=installed" 
# to install the httpd software package on host server1.
# 3. Verify that the package is installed using
ansible all -m command -a "rpm -qa | grep httpd"
#Analyzing the output, you can see that the rpm -qa command 
# runs successfully on the managed hosts, but the pipe is ignored.
# 4. Use 
ansible all -m shell -a "rpm -qa | grep httpd"
# In the output you can see that node server1
# gives a “non-zero return code” message,
# meaning that the command did not complete successfully. 
# You can also see a list of matching
# packages on server2. Last, you can see a
# warning message stating that you should use the
# yum module instead. Notice that the shell as
# well as the command modules reported a
# changed status as the result, even if nothing has
# really changed.
# 5. Use 
ansible all -m yum -a "list=httpd" 
# and compare the output to the output of the 
# command used in step 4.
# 6. Use 
ansible all -m command -a "systemctl status httpd" 
# to verify the current status of the
# httpd service. It should show the service is not
# found on server1 and the service is inactive and
# disabled on server2.
# 7. Use 
ansible ansible1 -m service -a "name=httpd enabled=yes state=started"
# to start and enable the httpd service on ansible1.
# 8. Run the command 
ansible all -m command -a "systemctl status httpd" 
# again to verify the modification has been applied.

# see local documentation
ansible-doc -l
ansible-doc -l | grep vmware
ansible-doc ping

# online doc 
# https://docs.ansible.com

# using playbooks
---
- name: install start and enable httpd
  hosts: web
  tasks:
  - name: install package
    yum:
    name: httpd
    state: installed
  - name: start and enable service
    service:
    name: httpd
    state: started
    enabled: yes

# At the start of each playbook, you find three dashes.
# Optionally, you may also find three dots at the end of the
# playbook. Using these characters makes it easy to embed
# the playbook code into something else and easily isolate
# the playbook code when it is included.

# While you’re working with playbooks, the target hosts
# are specified in the play, not in the command that runs
# the playbook (which happens in ad hoc commands).
# After you indicate the target hosts, you specify a list of
# tasks. Each item in the list is identified with a hyphen.
# For each task, you specify the Ansible module that the
# task is running and a name. Notice that using names for
# tasks is not mandatory but is highly recommended,
# because using names makes it a little easier to identify
# which tasks have been able to run successfully. Next, you
# should identify the arguments that the task should be
# running.
# To identify hierarchical relations in playbooks, you use
# indentation. The basic rules for indentation are easy:
# • Data elements at the same level in the hierarchy
# must have the same indentation.
# • Items that are children (properties) and another
# element are indented more than the parents.

# You create indentation using spaces. There is no
# requirement for how many spaces to use, but using two
# spaces is common. Using tabs for indentation is not
# permitted.
# Using TABS for indentation is NOT PERMITTED.

# Within the playbook, one or more plays are defined.
# Plays are the highest level in the playbook, and each play
# starts with a hyphen. The reason is that the playbook
# defines a list of plays, and it is valid if the list contains
# just one play. All properties of the play (name, hosts, and
# the word tasks) are indented at the same level, and next
# there is a list of tasks. The list of tasks is a property of the
# play, and these tasks are indented one level deeper than
# the parent items to show the hierarchical relation
# between play and tasks. The next level of indentation
# happens at the task argument level, where each
# argument that is passed to a task is indented one more
# level deeper.

# config vim for using two space instead of tab character
# add to ~/.vimrc
# autocmd FileType yaml setlocal ai ts=2 sw=2 et

# execute playbook
ansible-playbook playbook.yml

# YAML
# YAML is all about defining key-value pairs, also known
# as dictionaries. An example of such a key-value pair is
# name: vsftpd. Key-value pairs can be defined in two
# ways: key: value or key=value. Of these two, the first
# method is preferred, but the second way works also.
# If an object in YAML needs multiple key-value pairs to
# define its properties, it is common to define one keyvalue
# pair on a line, for example :
# - name: enable vsftpd
#   service: name=vsftpd enabled=true
# is the same as
# - name: enable vsftpd
#   service: 
#     name: vsftpd
#     enabled: true
# the seccond option is the one reccomended to use

# lists
# While you’re working with YAML in Ansible playbooks,
# keys can have one value, and some keys can have
# multiple values. No standard rule defines what is the
# case in which situation. Whether a key can contain
# multiple values depends on the Ansible module. When
# you use the yum module, for instance, you can specify a
# list of packages to the name key. When you use the
# service module, for instance, it’s not possible to specify a
# list as the argument to the name key.

---
- name: using lists
  hosts: all
  tasks:
  - name: install packages
    yum:
      name:
      - nmap
      - httpd
      - vsftpd
      state: latest

# strings
# In YAML files, you include strings on multiple occasions.
# Using strings is not difficult because the string doesn’t
# have to be escaped by using quotation marks. However,
# you are allowed to use quotation marks anyway. This
# means that all the following notations are valid:
# Line of text
# "Line of text"
# 'Line of text'
# There are two ways to deal with multiline strings. You
# can use the | sign in a multiline string to take over all
# newline characters. If all text in a multiline string just
# needs to be treated as a line of text, without any further
# formatting, you can use the > sign. Use the | sign if you
# want to maintain formatting. Use the > sign if you want
# to split text over multiple lines in the playbook for better
# readability, but the lines don’t have to be written as
# multiple lines in the target file.

# syntax-check
ansible-playbook --syntax-check playbook.yml
# yaml with errors
---
- name: install start and enable httpd
  hosts: all
  tasks:
  - name: install package
    yum:
    name: httpd
      state: latest
  - service:
    name: httpd
      state: started
      enabled: yes

# dry run
ansible-playbook -C playbook.yml

# yaml exercises
# 1. Open an editor to create the file exercise.yaml.
#     Define the playbook header by including the
#     following lines:
---
- name: copy multiline text
  hosts: ansible1
  tasks:
# 2. Add the first task. In this task you use the copy
#     module, using content and the | sign to copy
#     two lines of text to a file that does not yet exist:
---
- name: copy multiline text
  hosts: ansible1
  tasks:
  - name: copy text
    copy:
      content: |
        line 1
        line 2
      dest: /tmp/multiline1.txt
# 3. Add a second task that also uses the copy
#     module but this time uses the > sign:
---
- name: copy multiline text
  hosts: ansible1
  tasks:
  - name: copy text
  copy:
    content: |
      line 1
      line 2
    dest: /tmp/multiline1.txt
  - name: copy more text
  copy:
    content: >
      line 1
      line 2
    dest: /tmp/multiline2.txt
# 4. Use 
ansible-playbook exercise.yaml
#     to run the playbook and verify that in the output
#     you see two tasks reporting a changed status.
# 5. Verify the files that have been created. First, use
ansible ansible1 -a "cat /tmp/multiline1.txt" 
#     to verify the contents of the first file. 
#     Notice that it contains multiple lines.
# 6. Next, use 
ansible ansible1 -a "cat /tmp/multiline2.txt" 
# to verify that the file contains 
# all the separate lines on one single line.

