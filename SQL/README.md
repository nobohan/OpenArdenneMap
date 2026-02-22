# SQL snippets and materialized views

This folder contains some SQL snippet used for cartographic generalisation in OpenArdenneMap, using OpenStreetMap data.

The first folder "sql-snippets" has some SQL recipes for some generalisation processes:

- for the simplification/merging of buildings, based on `ST_ClusterDBSCAN`;
- for the displacement of linear features along other linear features;
- for parking roads simplification;
- for bridge symbol simplification;
- for merging parallel linear features (typically double railway lines and motorways).

The second folder "materialised views" are supposed to be "ready-to-go" SQL codes for creating some materialised views for these cartographic generalisation techniques. Materialised views are needed simply for performance reasons: running these SQL queries as layers in QGIS or with Mapnik are very slow, so we want to pre-process these data into materialised views.

So far this is not implemented in the QGIS project nor in the Mapnik scripts!

This work was made by Laupie2 in the context of a training at Champs-Libres Cooperatives.
