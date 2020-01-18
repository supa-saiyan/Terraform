#!/bin/bash

#sudo yum upgrade -y
sudo yum install httpd -y
sleep 30s 
sudo echo "from terraform" >> /var/www/html/index.html
sudo systemctl restart httpd

