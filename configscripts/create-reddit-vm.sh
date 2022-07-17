#!/bin/bash

yc compute instance create \
    --name reddit-vm \
    --hostname reddit-vm \
    --memory=4 \
    --create-boot-disk image-id=fd8a35sd24lt4lrrjihk \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --ssh-key ~/.ssh/appuser.pub
