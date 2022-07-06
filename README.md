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

 * Create template ubuntu16.json with sections builders, provisioners, and template variables.json.example with user variables.
 * Create machine image:
```
packer build -var-file=<path-to-variables.json.example> ubuntu16.json
```
 * Create VM from machine image.
### Terraform:
 * Download plugin for Yandex v.0.35
 * Run command
````
terraform init -plugin-dir=<path-to-plugin>
````
 * Create templates main.tf, outputs.tf and input variables variables.tf
 * Create instance:
```
terraform plan
terraform apply
```
### Terraform-2
 * Create 2 pcs machine images
 * Create modules "app", "db"
 * Create Terraform templates in folders "stage", "prod"
 * Create VM's. For this in each folder to enter commands:
```
terraform get
terraform init -plugin-dir=/home/user/klimenko-sergey_infra/terraform/plugin/
terraform validate
terraform plan
terraform apply -auto-approve
```
