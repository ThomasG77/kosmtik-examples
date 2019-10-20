rm pdx-poi.*
wget -O pdx-poi.osm "http://www.overpass-api.de/api/xapi?node[bbox=-122.68732,45.52028,-122.65217,45.53982][amenity=*]"
ogr2ogr -f CSV pdx-poi.csv pdx-poi.osm -oo "CONFIG_FILE=osmconf.ini" -dialect SQLITE -sql "SELECT name,osm_id,amenity,ST_X(geometry) AS x, ST_Y(geometry) AS y FROM points"
rm pdx-poi.osm
mkdir data/
cd data
wget http://mapbox-geodata.s3.amazonaws.com/natural-earth-1.4.0/cultural/10m-admin-0-countries.zip
unp *.zip
rm *.zip
cd ..