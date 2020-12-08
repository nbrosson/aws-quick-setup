We will:
- setup an EC2 machine with SSH access
- install Docker in this VM
- create a new user with sudo access
- Create a Docker group
- Add the new user in the Docker group


Pre-requisites: 
1. Awscli, Terraform and Ansible are installed in your device (please see specific documentations for that)
2. You logged in with awscli on your device 

The steps are below:

# Generate ssh public and private keys in the tf folder

We will need these keys to login to the EC2 machine. 

```
$ cd tf
$ mkdir ssh-keys
$ cd ssh-keys
$ ssh-keygen -t rsa -f aws_ssh_key
```


# Prepare the infrastructure with terraform

```
$ cd tf
$ terraform init
$ terraform apply
```

Keep your AWS elastic IP address as you will need it for the Ansible part


# Provision your new EC2 instance with Docker

```
$ cd ansible
$ ansible-playbook simpleplaybook.yml
```


# Check if it worked

By default, your_user is nbrosson.

```
$ ssh -i "your_ssh_key" your_user@your_elastic_ip_address
$ docker
$ docker ps
```

If no errors occured, it meaned everything worked.

# Stop everything

```
$ cd tf
$ terraform destroy
```