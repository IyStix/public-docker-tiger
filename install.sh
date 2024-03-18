#!/bin/sh

# Trigger erros
set -ex

# Install HAVM
wget https://gitlab.lre.epita.fr/tiger/havm/-/archive/master/havm-master.tar.gz
tar xvf havm-master.tar.gz
cd havm-master
./bootstrap
./configure
make
make install
cd ..
rm -rf havm-master.tar.gz havm-master


# Install Nolimips
wget https://gitlab.lre.epita.fr/tiger/nolimips/-/archive/master/nolimips-master.tar.gz
tar xvf nolimips-master.tar.gz
cd nolimips-master
./bootstrap
./configure
make
make install
cd ..
rm -rf nolimips-master.tar.gz nolimips-master

wget https://github.com/Genivia/RE-flex/archive/refs/tags/v3.2.12.zip
unzip v3.2.12.zip
cd RE-flex-3.2.12
./configure
make
make install
cd ..
rm -rf v3.2.12.zip RE-flex-3.2.12
