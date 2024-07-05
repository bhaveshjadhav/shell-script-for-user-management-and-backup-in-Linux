FROM ubuntu:latest
WORKDIR /root/script
COPY . .
RUN apt-get update -y && apt-get install git -y && apt-get install tar gzip -y && apt-get install sudo -y
