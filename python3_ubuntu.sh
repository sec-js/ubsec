#!/usr/bin/env bash


function install_python3_in_ub1604_by_apt(){
apt-get install -y software-properties-common && \
 add-apt-repository ppa:jonathonf/python-3.6 &&\
apt-get update -y && apt-get install python3.6 -y

}

function install_python3_in_ubuntu_by_build(){

apt-get install python3-dev libxml2-dev libffi-dev \
libssl-dev libxslt1-dev libsqlite3-dev libbz2-dev gcc make zlib1g-dev

PYTHON3_VERSION="3.6.2"
PYTHON3_PATH="/usr/share/python36"

wget "https://www.python.org/ftp/python/"$PYTHON3_VERSION"/Python-"$PYTHON3_VERSION".tgz" \
&& tar -zxvf  'Python-'$PYTHON3_VERSION'.tgz' -C /tmp \
&& cd '/tmp/Python-'$PYTHON3_VERSION && ./configure --prefix=$PYTHON3_PATH \
&& make && make install

## 创建软链接
ln -s $PYTHON3_PATH"/bin/python3" /usr/bin/python3
}

install_python3_in_ubuntu_by_build