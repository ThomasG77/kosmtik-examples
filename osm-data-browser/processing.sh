ogr2ogr -f CSV osm.csv nacis.osm -dialect SQLITE -sql "SELECT name,osm_id,ST_X(geometry) AS x, ST_Y(geometry) AS y FROM points"
