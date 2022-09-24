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
 * Create machine image:
```
packer build immutable.json
```
 * Create script for deploy VM with autostart web application
 * Deploy VM with autostart web application:
```
sh sh ../configscripts/create-reddit-vm.sh
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
### Logging-1
 * Create new Docker images for app:
```
for i in ui post-py comment; do cd src/$i; bash docker_build.sh; cd -; done
```
 * Push new images in repository:
```
for i in ui post comment; do docker push $USER_NAME/$i:logging; done
```
 * Create VM in Yandex Cloud:
```
yc compute instance create \
    --name logging \
    --cores=2 \
    --memory=4GB \
    --zone ru-central1-a \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=50 \
    --ssh-key ~/.ssh/id_rsa.pub
```
 * Create docker-machine:
```
sudo docker-machine create \
    --driver generic \
    --generic-ip-address=<public_ip_VM> \
    --generic-ssh-user yc-user \
    --generic-ssh-key ~/.ssh/id_rsa \
    docker-host
```
 * Connect to docker-machine:
```
eval $(docker-machine env logging)
```
 * Create compose-file named docker-compose-logging.yml
 * Create Dockerfile and build Docker image with Fluentd in directory logging/fluentd:
```
docker build -t $USER_NAME/fluentd .
```
 * Redact docker-compose.yml in directory docker for redirect logs in Fluentd and add Zipkin
 * Run logging system in directory docker:
```
docker-compose -f docker-compose-logging.yml -f docker-compose.yml down
docker-compose -f docker-compose-logging.yml -f docker-compose.yml up -d
```
