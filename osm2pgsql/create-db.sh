# run this as postgres user, eg:
# sudo -u postgres -i; sh ./create_db.sh
createuser osmpg
createdb -E UTF8 -O osmpg osmpg_db
psql -d osmpg_db -c "CREATE EXTENSION postgis;"
psql -d osmpg_db -c "CREATE EXTENSION postgis_sfcgal;"
psql -d osmpg_db -c "CREATE EXTENSION hstore;"
psql -d osmpg_db -c "ALTER TABLE geometry_columns OWNER TO osmpg;"
# Then, add the user
# sudo useradd -m  osmpg
# sudo passwd osmpg
