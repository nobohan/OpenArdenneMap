Docker image for installing Mapnik and printing your map
--------------------------------------------------------

Thanks to Marc Ducobu, there is now a docker image for installing the **last** version of Mapnik to use with OpenArdenneMap. Running the very last version (the dev version) of Mapnik is not yet another developer caprice but rather useful since, in 2019, only the last version of Mapnik offers a sound support for SVG pattern rendering without rasterisation of the pattern. This is crucial for map printing.  

# Installation

Simply go to this folder and run

```bash
$ docker-compose build
```

This may take 1 hour (mainly due to the Mapnik compilation)!

# Usage

First, make the container running:

```bash
$ docker-compose up -d
```

In the `docker-compose.yml` file, there is the mapping of the volume between the docker container and your machine. It means that you can use the files mounted in this volume to run the import and make the map.

To do so, open a bash terminal in the container with:

```bash
$ docker-compose run --rm mapnik bash
```

Then, change directory to /var/OpenArdenneMap and you can run the following command for importing the osm data and make the maps:

## Importing

```bash
root@51834f3f5bbd: osm2pgsql -c -G -H db -U osmpg -d osmpg_db -S osm2pgsql/OpenArdenneMap.style  --extra-attributes osm-files/extract.osm
```

where `extract.osm` is your osm (or pbf) file. 

(or simply use `import.sh`).

## Make the maps
```bash
root@51834f3f5bbd: carto osm2pgsql/project-docker.mml > osm2pgsql/OpenArdenneMap.xml && python3 makeMap.py
```

# Some changes to the original repo

In the `project.mml`, we had to add the "user" and the "host" for the PostGIS connection. If you use the project file locally, you should use the `project.mml` file with carto. If you use the docker image, use `project-docker.mml`.

```
"Datasource": {
  "dbname": "osmpg_db",
  "user": "osmpg",
  "host": "db",
  "type": "postgis"
},
```

This might be improved in the future (having just one unique project file).
