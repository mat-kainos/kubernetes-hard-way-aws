FROM jenkins/jenkins:2.180-alpine
ARG AWS_ACCESS_KEY_ID_ARG
ARG AWS_SECRET_ACCESS_KEY_ARG

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID_ARG
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY_ARG

COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY pwd.sensitive user.sensitive /tmp/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN rm -f pwd.sensitive user.sensitive

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root

RUN apk add --update \
    unzip \
    python3 \
    ansible

RUN pip3 install --upgrade pip
RUN pip3 install awscli --upgrade --user 
RUN curl https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip -o /tmp/terraform.zip
RUN unzip /tmp/terraform.zip -d "/usr/local/bin"
RUN rm -f /tmp/terraform.zip
