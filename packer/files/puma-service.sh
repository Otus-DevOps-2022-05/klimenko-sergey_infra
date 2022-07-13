#!/bin/bash

cat << EOF > /etc/systemd/system/puma.service
[Unit]
Description=Reddit Monolith
Requires=mongodb.service
After=mongodb.service

[Service]
Type=forking
WorkingDirectory=/home/ubuntu/reddit
ExecStart=/usr/local/bin/puma
ExecReload=/usr/local/bin/puma -R
PIDFile=/run/puma.pid

User=yc-user
Group=yc-user

[Install]
WantedBy=multi-user.target
EOF

chmod 755 /etc/systemd/system/puma.service
systemctl enable puma.service
# systemctl start puma.service
