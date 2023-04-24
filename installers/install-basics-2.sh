#!/bin/bash
DEBIAN_FRONTEND=noninteractive
# Enable exit on error
set -e
# Show all commands
set -x

echo "Installing system basics (part 2) ..."

sudo apt update -y

  # required by postgres
sudo apt-get install -y --no-install-recommends \
  libpq-dev 

  # python3-dev \
  # required by pyenv
sudo apt-get install -y --no-install-recommends \
  libreadline-dev \
  libedit-dev \
  xz-utils \
  locate \
  sqlite3 \
  xmlstarlet

  # GNU parallel
sudo apt-get install -y --no-install-recommends \
  parallel 

  # Search text and binary files
sudo apt-get install -y --no-install-recommends \
  yara 

  # Inkscape is installed to be able to convert SVG files
sudo apt-get install -y --no-install-recommends \
  inkscape 

sudo apt-get install -y --no-install-recommends \
  less \
  tree \
  bash-completion \
  socat 

  # Json Processor
sudo apt-get install -y --no-install-recommends \
  jq \
  rsync

  # sqlite3 driver - required for pyenv
sudo apt-get install -y --no-install-recommends \
  libsqlite3-dev 

  # Image support
sudo apt-get install -y --no-install-recommends \
  libtiff-dev \
  libjpeg-dev \
  libpng-dev \
  libglib2.0-0 \
  libxext6 \
  libsm6 \
  libxext-dev \
  libxrender1 \
  libzmq3-dev 

  # protobuffer support
sudo apt-get install -y --no-install-recommends \
  protobuf-compiler \
  libprotobuf-dev \
  libprotoc-dev \
  autoconf \
  automake \
  libtool \
  cmake  \
  fonts-liberation \
  google-perftools 

  # Compression Libs
  # also install rar/unrar? but both are propriatory or unar (40MB)
sudo apt-get install -y --no-install-recommends \
  zip \
  gzip \
  unzip \
  bzip2 \
  lzop \
  tzdata

  # nbconvert dependencies
  # https://nbconvert.readthedocs.io/en/latest/install.html#installing-tex
sudo apt-get install -y --no-install-recommends \
  texlive-xetex \
  texlive-fonts-recommended \
  texlive-plain-generic 

  # deprecates bsdtar (https://ubuntu.pkgs.org/20.04/ubuntu-universe-i386/libarchive-tools_3.4.0-2ubuntu1_i386.deb.html)
sudo apt-get install -y --no-install-recommends \
  libarchive-tools 

  # zlibc \ obsolete in ubuntu 22.04
  # zlibc \
sudo apt-get install -y --no-install-recommends \
  zlib1g 

  # unpack (almost) everything with one command
sudo apt-get install -y --no-install-recommends \
  unp \
  libbz2-dev \
  liblzma-dev \
  zlib1g-dev \
  sudo

pip install iplantuml
echo **/.ipynb_checkpoints/** > .gitignore
sudo apt upgrade -y

exit 0
