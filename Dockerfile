FROM ubuntu

RUN apt update && apt install -y maven git && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    chmod +x kubectl

RUN PATH=$PATH:~/.local/bin

ENTRYPOINT ["java", "--version"]
