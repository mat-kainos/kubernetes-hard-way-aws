#!/bin/sh

cd jenkins

echo "Create new Jenkins user:"
read user

echo "Create password for user $user: "
read pwd

echo $user > user.sensitive
echo $pwd > pwd.sensitive

echo "Building docker image: kthw-jenkins"


AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key)

docker build \
-t kthw-jenkins \
--build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
--build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
.



