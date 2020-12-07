This repo assumes:
1. Awscli, Terraform and Ansible are installed in your device. 
2. you generated ssh public and private key in tf folder:
```
$ cd tf
$ mkdir ssh-keys
$ ssh-keygen -t rsa -f aws_ssh_key
```
3. You logged in with awscli on your device 


# Prepare the infrastructure with terraform

```
$ cd tf
$ terraform init
$ terraform apply
```

Keep your AWS elastic IP address as you will need it for the Ansible part


# Provision your new EC2 instance with Docker

```
cd ansible
ansible-playbook simpleplaybook.yml
```


# Check if it worked

```
ssh -i "your_ssh_key" ubuntu@your_elastic_ip
docker 
```

# Stop everything

```
cd tf
terraform destroy
```