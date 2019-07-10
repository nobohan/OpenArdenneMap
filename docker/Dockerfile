FROM debian:9

LABEL maintainer="Champs-Libres <info@champs-libres.coop>"

RUN apt-get update && apt-get install -y git make python clang libboost-dev \
libicu-dev libz3-dev libfreetype6-dev libxml2-dev libharfbuzz-dev \
libboost-system-dev libboost-filesystem-dev libboost-regex-dev \
libboost-program-options-dev libproj-dev libgdal-dev \
wget curl libboost-python-dev libboost-thread-dev \
libcairo2-dev osm2pgsql

# install pip

RUN mkdir /var/mapnik

RUN mkdir /var/mapnik/pip

WORKDIR /var/mapnik/pip

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

WORKDIR /var/mapnik
RUN git clone https://github.com/mapnik/mapnik.git
RUN git clone https://github.com/mapnik/python-mapnik


WORKDIR /var/mapnik/mapnik
RUN git submodule update --init
RUN make && make install


WORKDIR /var/mapnik/python-mapnik
RUN python setup.py install

WORKDIR /var

# Install carto (nvm -> npm -> carto)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

RUN /bin/bash -c 'source "/root/.nvm/nvm.sh" ;\
  nvm install node ;\
  npm install carto -g'
