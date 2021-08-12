## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/LaneSchoof/scripts/blob/main/diagrams/Complete%20Network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

- install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protect the server from a DDOS attacks by using an off loading function to shift attack traffic. They do this by distributing the total sets of tasks over the available resources.
- A jump box is an advantageous system to have on a network because it is a single node that can be secured and monitored. It is useful due to its capability of managing devices in a separate security zone. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system traffic.
- Filebeat monitors log files and locations you specify. Once collected it forwards them to elastic search or log stash for indexing.
- Metricbeat collects metrics from the operating system and from services running on the server. 

The configuration details of each machine may be found below.

| Name                 | Function   | IP Address | Operating System |
|----------------------|------------|------------|------------------|
| Jump-Box-Provisioner | Gateway    | 10.0.0.4   | Linux            |
| Web-1                | Web Server | 10.0.0.7   | Linux            |
| Web-2                | Web Server | 10.0.0.6   | Linux            |
| Web-3                | Web Server | 10.0.0.8   | Linux            |
| Elk-Stack-VM         | Monitoring | 10.1.0.4   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My IPv4

Machines within the network can only be accessed by Port 22.
- Jump-Box-Provisioner: With Private IP Address 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses                          |
|----------------------|---------------------|-----------------------------------------------|
| Jump-Box-Provisioner | Yes                 | My IPv4                                       |
| Web-1                | No                  | 10.0.0.4                                      |
| Web-2                | No                  | 10.0.0.4                                      |
| Web-3                | No                  | 10.0.0.4                                      |
| Elk-Stack-VM         | Yes                 | My IPv4 from port 5601, 10.0.0.4 from port 22 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves resources such as time and ensures consistant and repeatable deployments.

- The main advantage of automating configuration ensures that the configuration is consistent and it allows for any changes made to be universal among all Virtual Machines associated with Ansible.

The playbook implements the following tasks:
- Install docker.io
- Install python3-pip
- Install Install Docker module
- Increase virtual memory
- Use more memory with parameters
	-value: 262144
	-state: present
	-reload: no
-Download and launch a docker elk container
-Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/LaneSchoof/scripts/blob/main/ansible/images/docker%20ps.JPG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.7
- Web-2 10.0.0.6
- Web-3 10.0.0.8

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat is utilized to send server log files to kibana, monitor log events, and accumulate logs.
- Metricbeat collects metrics from services running on the server and watches for any information within the file system that has been altered and provides the time when the changes took place.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml and metricbeat-playbook.yml file to /etc/ansible/roles.

- Update the /etc/ansible/hosts file to include:

[webservers]

10.0.0.6 ansible_python_interpreter=/usr/bin/python3

10.0.0.7 ansible_python_interpreter=/usr/bin/python3

10.0.0.8 ansible_python_interpreter=/usr/bin/python3

[elk]

10.1.0.4 ansible_python_interpreter=/usr/bin/python3

- Run the playbook, and navigate to http://[Elk-Stack-VM-ip]:5601/app/kibana#/home to check that the installation worked as expected.
- The finalized playbook is install-elk.yml and is copied under the path /etc/ansible
- To make Ansible run the playbook on a specific machine? /etc/ansible/hosts
- To specify which machine to install the ELK server on versus Filbeat utilize the portion of the hosts file with the headings [webservers] and [elk].
- To check that the ELK server is running use the url: http://[Elk-Stack-VM-ip]:5601/app/kibana#/home
 
To update the playbook run:
- ansible-playbook /etc/ansible/install-elk.yml
