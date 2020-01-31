#!/bin/bash
#get admin privileges (out of date because EC2 user data script use root pivileges by defaut)
sudo su

#Install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
EC2_AVAIL_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo "<h1>Tarek says Hello world from $(hostname -f) in AZ $EC2_AVAIL_ZONE</h1>" > /var/www/html/index.html