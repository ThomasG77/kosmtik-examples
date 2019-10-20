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

## Speakers notes

Some project directories contain setup scripts (e.g. `convert.py`) and other notes (e.g. `notes.md`)

If you encounter a project that does not load and is missing a README with setup instructions, then feel free to create an [issue](https://github.com/springmeyer/tilemill-examples/issues) and I will add some details.

These projects specifically require setup:

1. `dynamic-http` requires running a local python server in order to support data refresh:

```sh
python project/dynamic-http/server.py
```
