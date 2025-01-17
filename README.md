# kosmtik-examples

This is a set of Tilemill projects now migrated to use Kosmtik that demonstrate various types of advanced functionality. The examples are mostly self-contained
and should mostly work offline. See the instructions below for project-specific setup that might be needed in a few places.


## Usage

You can either download this directory and point Kosmtik's documents setting at it.

Or you can use git to set the projects up within an existing documents directory.

## Setup in existing project directory

    cd your_directory
    git clone https://github.com/ThomasG77/kosmtik-examples.git
    nvm use lts/carbon
    cd kosmtik-examples
    npm i
    cd node_modules/kosmtik/
    npm i
    cd ../..

Then for each project, do run the following and open <http://localhost:6789>

Alternate setup could be using docker in particular on Windows (because https://github.com/mapnik/node-mapnik/issues/848) e.g

```
docker run --rm -it \
    -p 6789:6789 -v your_absolute_path_to_tilemill_examples_repo/city-name:/opt/project \
    -e USER_ID=1000 \
    joxit/kosmtik \
    kosmtik serve /opt/project/project.mml --host 0.0.0.0
```

Be careful as we don't plan to document heavily docker usage (in particular how to use PostGIS samples with kosmtik) except if we got contributions (PS: working on Linux box hence this viewpoint).

### Arrrrrrr

    cd arrrrrrr
    sh download.sh
    cd ..
    npx kosmtik serve arrrrrrr/project.mml

### City name

    cd city-name
    sh download.sh
    cd ..
    npx kosmtik serve city-name/project.mml

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

    npx kosmtik serve fancy-formatted-label/project.mml

### Feature dependent desaturation

    cd feature-dependent-desaturation
    sh download.sh
    cd ..
    npx kosmtik serve feature-dependent-desaturation/project.mml

### Hand drawn patterns

    cd hand-drawn-patterns
    sh download.sh
    cd ..
    npx kosmtik serve hand-drawn-patterns/project.mml

### Intensity map

    cd intensity-map
    sh download.sh
    cd ..
    npx kosmtik serve intensity-map/project.mml

### Labels along lines

    cd labels-along-lines
    sh download.sh
    cd ..
    npx kosmtik serve labels-along-lines/project.mml

### Labels no significant digits

    cd labels-no-significant-digits
    sh download.sh
    cd ..
    npx kosmtik serve labels-no-significant-digits/project.mml

### Maki amenities

    cd maki-amenities
    sh download.sh
    cd ..
    npx kosmtik serve maki-amenities/project.mml

### Octocat mask

    cd octocat-mask
    sh download.sh
    cd ..
    npx kosmtik serve octocat-mask/project.mml

### OSM data browser

    # Optional, you can take a look if curious
    # cd osm-data-browser
    # sh processing.sh
    # cd ..
    npx kosmtik serve osm-data-browser/project.mml

### Pattern compositing smoothing

    cd pattern-compositing-smoothing
    sh download.sh
    cd ..
    npx kosmtik serve pattern-compositing-smoothing/project.mml

### Postgis raster datasource

    # Need a PostgreSQL database with PostGIS (if PostGIS 3, uncomment line mentioning it in `pgraster-source/download.sh`)
    cd pgraster-source
    sh download.sh
    cd ..
    npx kosmtik serve pgraster-source/project.mml

### Proportional symbol

    cd proportional-symbol
    sh download.sh
    cd ..
    npx kosmtik serve proportional-symbol/project.mml

### Shield placements

    cd shield-placements
    sh download.sh
    cd ..
    npx kosmtik serve shield-placements/project.mml

### Single tint band

    cd single-tint-band
    sh download.sh
    cd ..
    npx kosmtik serve single-tint-band/project.mml

### Smart halos

    cd smart-halos
    sh download.sh
    cd ..
    npx kosmtik serve smart-halos/project.mml

### SQL on the fly

    # Need a PostgreSQL database with PostGIS
    cd sql-on-the-fly
    sh download.sh
    sh process.sh
    cd ..
    npx kosmtik serve sql-on-the-fly/project.mml

### Stars

    cd stars
    sh download.sh
    cd ..
    npx kosmtik serve stars/project.mml

### SVG transforms

This project depends from one of the "Colorize alpha" layer. Run it before or the sample will not work!

    cd svg-transforms
    sh download.sh
    cd ..
    npx kosmtik serve svg-transforms/project.mml

### Tint bands

    # cd tint-bands
    # sh download.sh
    # cd ..
    # npx kosmtik serve tint-bands/project.mml
    # You could run previous commented code but to avoid downloading again
    # `10m-admin-0-countries.shp`, you can use a `localconfig.js` file to 
    # overload default configuration to reuse `arrrrrrr/data/10m-admin-0-countries.shp`. It's done by running the following:
    npx kosmtik serve --localconfig localconfig.js tint-bands/project.mml

## Export demo projects to XML

You can see an example below:
	
	# Using kosmtik
    npx kosmtik export tint-bands/project.mml --format xml > tint-bands/project.xml
    # Using carto (if `npm i carto`)
    npx carto tint-bands/project.mml > tint-bands/project.xml

## Export demo projects to png

    npx kosmtik export tint-bands/project.mml --localconfig localconfig.js --width 4000 --height 2400 --output /tmp/out.png --bounds=-180,-35,180,70 --format png --scale 4 --zoom 4

## Speakers notes

Some project directories contain setup scripts (e.g. `convert.py`) and other notes (e.g. `notes.md`)

If you encounter a project that does not load and is missing a README with setup instructions, then feel free to create an [issue](https://github.com/ThomasG77/kosmtik-examples/issues) and I will add some details.

These projects specifically require setup:

1. `dynamic-http` requires running a local python server in order to support data refresh:

```sh
python dynamic-http/server.py
```

## Credits

* Dane Springmeyer for most work at original repository <https://github.com/ThomasG77/kosmtik-examples/> (PS: we made some additional samples but this repo is more an update at the moment)
