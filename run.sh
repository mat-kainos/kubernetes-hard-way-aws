#!/bin/sh

cd jenkins

NAME=kthw-jenkins

echo "Create new Jenkins admin user:"
read user

echo "Create password for user $user: "
read pwd

echo $user > user.sensitive
echo $pwd > pwd.sensitive

echo "Building docker image: kthw-jenkins"

AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key)

docker build \
-t $NAME \
--build-arg AWS_ACCESS_KEY_ID_ARG=$AWS_ACCESS_KEY_ID \
--build-arg AWS_SECRET_ACCESS_KEY_ARG=$AWS_SECRET_ACCESS_KEY \
.

echo "Stopping and removing kthw-jenkins container (if it exists)"
docker container stop $NAME
docker container rm $NAME

echo "Running kthw-jenkins container"
docker run -d --name=$NAME -p 8080:8080 -p 50000:50000 $NAME
