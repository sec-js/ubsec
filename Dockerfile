FROM ubuntu:16.04

ENV CACHE_PATH=/opt/share

RUN mkdir ${CACHE_PATH}

ADD . ${CACHE_PATH}

RUN apt-get -yqq update
RUN apt-get install -y gcc make curl wget
# apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
# RUN wget https://archive.kali.org/archive-key.asc && apt-key add archive-key.asc
RUN apt-key add ${CACHE_PATH}/archive-key.asc
RUN echo "deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list


RUN apt-get -yqq update

RUN apt-get install nmap \
cewl wpscan nikto sqlmap gobuster dnsrecon \
hydra enum4linux ncrack snmp* medusa exploitdb

# RUN firefox xvfb rpcclient

USER root