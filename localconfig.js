exports.LocalConfig = function (localizer, project) {
    // localizer.where('center').then([29.9377, -3.4216, 9]);
    localizer.where('Layer').if({'Datasource.type': 'postgis'}).then({
        "Datasource.password": "osm",
        "Datasource.user": "osm",
        "Datasource.host": "localhost"
    });

    localizer.where('Layer').if({'id': 'countries'}).then({
        "Datasource.file": "../arrrrrrr/data/10m-admin-0-countries.shp"
    });
    // You can also do it in pure JS
    // project.mml.bounds = [1, 2, 3, 4];
};