FROM ubuntu

# Install basic tooling
RUN apt update && apt install -y maven git ca-certificates curl wget

#Install kubectl
RUN curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# Install HELM
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz
RUN tar xvf helm-v3.9.3-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin
RUN rm -rf linux-amd64



ENTRYPOINT ["helm", "--version"]
