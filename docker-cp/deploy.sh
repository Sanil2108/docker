#!/bin/bash
docker save -o web-server-testing.tar web-server-testing
scp -oStrictHostKeyChecking=no -i ../../aws/main-instance.pem web-server-testing.tar ubuntu@$1:/home/ubuntu
ssh -oStrictHostKeyChecking=no -i ../../aws/main-instance.pem ubuntu@13.127.220.153 "sudo docker load -i /home/ubuntu/web-server-testing.tar; sudo docker run -itd -p 80:80 --name web-server-testing web-server-testing"

