# klimenko-sergey_infra
klimenko-sergey Infra repository

```
bastion_IP = 51.250.86.169
someinternalhost_IP = 10.128.0.29
```

### Bastion. Additional homework

```
alias ssh_someinternalhost='ssh -i ~/.ssh/appuser -A appuser@<bastion_public_ip> ssh <someinternalhost_private_ip>'
```
[Pritunl with Let's Encrypt certificate.](https://51.250.86.169.sslip.io)

### Deploy test app
```
testapp_IP = 51.250.76.221
testapp_port = 9292
```
### Startup script for VM with Monolith Reddit
```
sh reddit-app2.sh
```
### Packer:

 * Create template ubuntu16.json with sections builders, provisioners and template variables.json.example with user variables.
 * Create machine image:
```
packer build -var-file=<path-to-variables.json.example> ubuntu16.json
```
 * Create VM from machine image.

### Packer. Additional homework
 * Create additional scripts deploy.sh, puma-service.sh
 * Create template immutable.json with sections builders, provisioners
 * Create machine bake-image:
```
packer build immutable.json
```
 * Create script for deploy VM with autostart web application
 * Deploy VM with autostart web application:
```
sh ../configscripts/create-reddit-vm.sh
```
### Terraform:
 * Download plugin for Yandex v.0.35
 * Run command
```
terraform init -plugin-dir=<path-to-plugin>
```
 * Create templates main.tf, outputs.tf and input variables variables.tf
 * Create instance:
```
terraform plan
terraform apply
```
### Terraform-2
 * Create 2 pcs machine images
 * Create modules "app", "db"
 * Create Terraform templates in directories "stage", "prod"
 * Create VM's. For this in each directory to enter commands:
```
terraform get
terraform init -plugin-dir=/home/user/klimenko-sergey_infra/terraform/plugin/
terraform validate
terraform plan
terraform apply -auto-approve
```
### Ansible-1:
 * Familiarity with the tool:
   * Install Ansible:
     ```
     pip install -r ansible>=2.4
     ```
   * Create inventory files: inventory, inventory.yaml
   * Create config file ansible.cfg
   * Remote management of nodes using modules ping, uptime, command, shell, git, etc. Example:
     ```
     ansible app -m shell -a 'ruby -v; bundler -v'
     ```
   * Create playbook clone.yml
   * Execution of commands:
     ```
     ansible-playbook clone.yml
     ```
### Ansible-2:
 * One playbook with one play - reddit_app_one_play.yml
 * Config template mongod.conf.j2
 * Instance and deploy web application
 * One playbook with multiple plays - reddit_app_multiple_plays.yml
 * Multiple playbooks: app.yml, db.yml, deploy.yml, site.yml
 * Playbooks for Packer: packer_app.yml, packer_db.yml
 * Change section provisioners in Packer templates: packer/app.json, packer/db.json
 * Start the project:
   * Execution of commands in directory packer:
     ```
     packer build -var-file=variables.json app.json
     packer build -var-file=variables.json db.json
     ```
   * Execution of command in directory terraform/stage:
     ```
     terraform apply -auto-approve
     ```
   * Execution of command in directory ansible:
     ```
     ansible-playbook site.yml
     ```
### Ansible-3:
 * Familiarity with Ansible Galaxy and create structure of roles:
   ```
   ansible-galaxy init app
   ansible-galaxy init db
   ```
 * Create roles for DB and web application
 * Adapt Ansible configurations for using roles
 * Create environments stage and prod in directory ansible
 * Using Community-roles jdauphant.nginx for access web application via port 80
 * Work with Ansible Vault and add creating users in playbooks
 * Start the project:
   * Execution of commands in directory terraform/stage:
     ```
     terraform destroy -auto-approve
     terraform apply -auto-approve
     ```
   * Execution of command in directory ansible:
     ```
     ansible-playbook playbooks/site.yml
     ```
### Ansible-4:
 * Install Vagrant
 * Create Vagrantfile with local Infrastructure for definition 2 pcs VM
 * Create 2 pcs VM:
   ```
   vagrant up
   vagrant box list
   vagrant status
   ```
 * Completion roles app and db, then provisioning:
   ```
   vagrant provision dbserver
   vagrant provision appserver
   ```
 * Using Community-roles jdauphant.nginx for access web application via port 80
 * Testing roles:
    * Install Molecule
    * Create tests for role db:
      ```
      molecule init scenario --role-name default -r db -d vagrant
      ```
    * Create VM for test:
      ```
      molecule create
      molecule list
      ```
    * Run tests:
      ```
      molecule verify
      ```
    * Redacted playbooks packer_db.yml, packer_app.yml for called roles db, app.
    * Execution of commands in directory packer:
     ```
     packer build -var-file=variables.json app.json
     packer build -var-file=variables.json db.json
     ```
