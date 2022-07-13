#!/bin/bash

sudo apt update
sleep 15

### Not work in Russia:
# sudo apt-get install -y mongodb-org
# sudo systemctl start mongod
# sudo systemctl enable mongod
# sudo systemctl status mongod
###

sudo apt install -y mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo systemctl status mongodb
