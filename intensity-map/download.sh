mkdir data/
cd data
wget http://mapbox-geodata.s3.amazonaws.com/natural-earth-1.4.0/cultural/10m-admin-0-countries.zip
wget http://cartodb.s3.amazonaws.com/static/crashes_2007_2009.zip
unp *.zip
rm *.zip
rm -rf __MACOSX
cd ..