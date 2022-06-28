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

### Deploy test app

testapp_IP = 51.250.76.221

testapp_port = 9292

### Startup script for VM with Monolith Reddit

sh reddit-app2.sh

### Packer:

*Create template ubuntu16.json with sections builders, provisioners, and template variables.json.example with user variables.
*Create machine image:
```
packer build -var-file=<path-to-variables.json.example> ubuntu16.json
```
*Create VM from machine image.
