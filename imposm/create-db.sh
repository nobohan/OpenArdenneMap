# run this as postgres user, eg:
# imposm-psqldb > create_db.sh; sudo su postgres; sh ./create_db.sh
set -xe
createuser --no-superuser --no-createrole --createdb osm
createdb -E UTF8 -O osm osm
psql -d osm -c "alter user osm with password 'osm';"
psql -d osm -c "create extension postgis;"
psql -d osm -f YOUR PATH TO VENV: /venv/local/lib/python2.7/site-packages/imposm/900913.sql
echo "ALTER TABLE geometry_columns OWNER TO osm;" | psql -d osm
echo "ALTER TABLE spatial_ref_sys OWNER TO osm;" | psql -d osm
echo "ALTER USER osm WITH PASSWORD 'osm';" |psql -d osm
echo "host	osm	osm	127.0.0.1/32	md5" >> /etc/postgresql/9.5/main/pg_hba.conf 	# <- CHANGE THIS PATH
set +x
echo "Done. Don't forget to restart postgresql!"
