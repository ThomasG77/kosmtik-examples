# tilemill-examples

This is a set of TileMill projects that demonstrate various types of advanced
functionality and fun hacks in TileMill. The examples are mostly self-contained
and should mostly work offline. See the Speakers Notes below for project-specific setup that might be needed in a few places.


## Usage

You can either download this directory and point TileMill's documents setting at it.

Or you can use git to set the projects up within an existing documents directory.

## Setup in existing project directory

    cd your_directory
    git clone https://github.com/ThomasG77/tilemill-examples.git
    nvm use lts/carbon
    cd tilemill-examples
    npm i
    cd node_modules/kosmtik/
    npm i
    cd ../..

Then for each project, do

### City name

    cd city-name
    sh download.sh
    cd ..
    npx kosmtik serve city-name/project.mml

### Stars

    cd stars
    sh download.sh
    cd ..
    npx kosmtik serve city-name/project.mml

Ypu may want to convert vrt to shp using `ogr2ogr` and use `mapnik-index` for performances. This advice is valid if you want file based datasource, otherwise use a database or vector tiles but it's out of the scope of this sample.



## Speakers notes

Some project directories contain setup scripts (e.g. `convert.py`) and other notes (e.g. `notes.md`)

If you encounter a project that does not load and is missing a README with setup instructions, then feel free to create an [issue](https://github.com/springmeyer/tilemill-examples/issues) and I will add some details.

These projects specifically require setup:

1. `dynamic-http` requires running a local python server in order to support data refresh:

```sh
python project/dynamic-http/server.py
```

1. `sql-on-the-fly` requires creating a postgres db and importing a shapefile:

```sh
cd ./sql-on-the-fly
createdb -T template_postgis states
shp2pgsql -g geom -s 4326 ./data/us_states_wgs84.shp states | psql states
```
