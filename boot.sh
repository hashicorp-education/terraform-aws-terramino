#!/bin/bash

curl -OL https://go.dev/dl/go1.23.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.23.1.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
export HOME="/tmp/home"
export GOPATH="/tmp/go"
export GOMODPATH="/tmp/go/pkg/mod"
export GOCACHE="/tmp/go/cache"

cd /tmp
git clone https://github.com/BrianMMcClain/terramino-go-ssm.git
cd terramino-go-ssm

git checkout ssm

# Use the AWS instance metadata API to get the instance's region
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600")
export AWS_REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/region)

APP_NAME=${app_name} TERRAMINO_PORT=${port} go run main.go
