sudo su -p postgres
createdb states
psql states -c "CREATE EXTENSION postgis"
shp2pgsql -s 4326 ./data/us_states_wgs84.shp states | psql states
psql states -c "CREATE USER osm with encrypted password 'osm'"
