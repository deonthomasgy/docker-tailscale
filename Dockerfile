FROM ubuntu:22.04

MAINTAINER Deon Thomas "deon.thomas@invernisoft.com"

RUN apt-get update -qq && apt-get install -y iptables curl openssh-client

RUN curl -fsSL https://tailscale.com/install.sh | sh

RUN update-alternatives --set iptables /usr/sbin/iptables-legacy

RUN  mkdir /var/run/tailscale


CMD ["sh", "-c", "while true; do sleep 3600; done"]
