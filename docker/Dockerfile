FROM justb4/mapnik

WORKDIR /var

# Install carto (nvm -> npm -> carto)
RUN apt-get update && apt-get install -y curl osm2pgsql
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

RUN /bin/bash -c 'source "/root/.nvm/nvm.sh" ;\
  nvm install node ;\
  npm install carto -g'
