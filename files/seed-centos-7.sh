#!/usr/bin/env bash

set -e
set -x

if [ -d "/etc/ansible" ]; then
    exit 42
fi

yum makecache -y

yum update -y

yum install \
  python-setuptools \
  python-devel \
  openssl-devel \
  sudo \
  libffi-devel \
  git \
  gcc \
  gcc-c++ \
  make \
  openssl-devel \
  libxml2 \
  libxml2-devel \
  libxslt \
  libxslt-devel \
  perl-devel \
  automake \
  vim \
  curl \
  -y

# htop
wget dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
rpm -ihv epel-release-7-11.noarch.rpm

for i in 1 2 3 4 5; do easy_install pip && break || sleep 2; done

pip install -U pyopenssl ndg-httpsclient pyasn1

pip install -U pip ansible

mkdir -p /etc/ansible/
