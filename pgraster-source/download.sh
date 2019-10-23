mkdir -p data
cd data
wget https://raw.githubusercontent.com/nvkelso/natural-earth-raster/master/50m_rasters/GRAY_50M_SR_OB/GRAY_50M_SR_OB.prj
wget https://raw.githubusercontent.com/nvkelso/natural-earth-raster/master/50m_rasters/GRAY_50M_SR_OB/GRAY_50M_SR_OB.tif
wget https://raw.githubusercontent.com/nvkelso/natural-earth-raster/master/50m_rasters/GRAY_50M_SR_OB/GRAY_50M_SR_OB.tfw

sudo su -p postgres
createdb rasterdb
psql rasterdb -c "CREATE EXTENSION postgis"
# If PostgIS 3.x+, run also (uncomment following line)
# psql rasterdb -c "CREATE EXTENSION postgis_raster"
psql rasterdb -c "CREATE USER osm with encrypted password 'osm'"
exit

gdalwarp -s_srs EPSG:4326 -t_srs EPSG:4326 -te -180 -90 0 0 GRAY_50M_SR_OB.tif gray_50m_partial_bl.tif
gdalwarp -s_srs EPSG:4326 -t_srs EPSG:4326 -te -180 0 0 90 GRAY_50M_SR_OB.tif gray_50m_partial_tl.tif
gdalwarp -s_srs EPSG:4326 -t_srs EPSG:4326  -te 0 -90 180 0 GRAY_50M_SR_OB.tif gray_50m_partial_br.tif
gdalwarp -s_srs EPSG:4326 -t_srs EPSG:4326 -te 0 0 180 90 GRAY_50M_SR_OB.tif gray_50m_partial_tr.tif

raster2pgsql -s 4326 -C -l 2,4 -I -F -t 2700x2700 GRAY_50M_SR_OB.tif gray_50m_sr_ob \
| psql -h localhost -p 5432 -U osm -d rasterdb
cd ..
