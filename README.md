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

Then for each project, do run the following and open <http://localhost:6789>

### City name

    cd city-name
    sh download.sh
    cd ..
    npx kosmtik serve city-name/project.mml

### Stars

    cd stars
    sh download.sh
    cd ..
    npx kosmtik serve stars/project.mml

### Arrrrrrr

    cd arrrrrrr
    sh download.sh
    cd ..
    npx kosmtik serve arrrrrrr/project.mml

### Colorize alpha

    cd colorize-alpha
    sh download.sh
    cd ..
    npx kosmtik serve colorize-alpha/project.mml

### Color variables and functions

    cd color-variables-and-functions
    sh download.sh
    cd ..
    npx kosmtik serve color-variables-and-functions/project.mml

### Compositing circles

    cd compositing-circles
    sh download.sh
    cd ..
    npx kosmtik serve compositing-circles/project.mml

### Custom map projections

    cd custom-map-projection
    sh download.sh
    cd ..
    npx kosmtik serve custom-map-projection/project.mml

### Data-driven markers

    cd data-driven-markers
    sh download.sh
    cd ..
    npx kosmtik serve data-driven-markers/project.mml

### Dynamic http

Not working on kosmtik at the moment

### Enhance low resolution raster

    cd enhance-low-res-raster
    sh download.sh
    cd ..
    npx kosmtik serve enhance-low-res-raster/project.mml

### Fancy formatted label

    cd fancy-formatted-label
    sh download.sh
    cd ..
    npx kosmtik serve fancy-formatted-label/project.mml


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