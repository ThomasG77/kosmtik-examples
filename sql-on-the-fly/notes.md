# Instructions (after data loading)

Go in `project.mml` to line `"table": "states"`. Then, replace `"states"`
with following queries (each at a time). Each time you save one of them, it should refresh if Kosmtik is opened.

Warning: the SQL query should be in one line or line return
with \n should be indicated to not break `project.mml`.


- only render multigeometries
(select * from states
where ST_NumGeometries(geom) > 1
) as tmp

- convert to lines, simplify
(select ST_Simplify(ST_Boundary(geom),.2) as geom from states
) as tmp

- limit at db level with spatial query
(select * from states where
  ST_Intersects(geom,ST_SetSRID('Point(-122 45)'::geometry,4326))
) as tmp

- convert to points, smallest values on top:
(select ST_Centroid(geom) as geom, persons from states
  order by persons desc) as tmp

- clip out in a 10 degree buffer around pdx
(select
  ST_Intersection(geom,
    ST_Buffer(
      ST_SetSRID('Point(-122 45)'::geometry,4326)
   ,10)
)
as geom from states
) as tmp

