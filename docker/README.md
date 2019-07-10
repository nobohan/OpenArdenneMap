Docker image for installing Mapnik and printing your map
--------------------------------------------------------

Thanks to Marc Ducobu, there is now a docker image for installing the **last** version of Mapnik to use with OpenArdenneMap. Running the very last version (the dev version) of Mapnik is not a developer caprice but rather useful since, in 2019, only the last version of Mapnik offers a sound support for SVG pattern rendering without rasterisation of the pattern. This is important for map printing.  

# Installation

Simply go to this folder and run

```bash
$ docker-compose build
```

This may takes 1 hour.

# Usage

```bash
$ docker-compose up
```

In the `docker-compose.yml` file, there is the mapping of the volume between the docker container and your machine. It means that you can use the files mounted in this volume to run the import and make the map.

To do so, open a bash terminal in the container with:

```bash
$ docker-compose run mapnik /bin/bash
```

Then, change directory to /var/OpenArdenneMap and you can run the commands in the OpenArdenneMap README for importing the data and make some maps (THIS DOES NOT WORK AT THE MOMENT)


# Future

So far, this docker image does not install the database needed for making the maps, so you still need to install it on your machine.

List of things to install for a full docker machine
* add a postgis container
* install lastest carto
* osm2pgsql
