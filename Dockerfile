FROM ubuntu

RUN apt update &&  apt install -y maven git

ENTRYPOINT ["java", "--version"]